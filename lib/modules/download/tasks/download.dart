import 'dart:async';
import 'dart:io';

import 'package:async/async.dart';
import 'package:eh_redux/database/database.dart';
import 'package:eh_redux/modules/download/interrupter.dart';
import 'package:eh_redux/modules/download/types.dart';
import 'package:eh_redux/modules/download/utils.dart';
import 'package:eh_redux/modules/gallery/types.dart';
import 'package:eh_redux/modules/image/store.dart';
import 'package:eh_redux/modules/session/store.dart';
import 'package:eh_redux/services/ehentai.dart';
import 'package:eh_redux/utils/notification.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';
import 'package:meta/meta.dart';
import 'package:path/path.dart' as p;

class _CanceledException {}

class _FileWithSize {
  _FileWithSize({
    @required this.file,
    @required this.size,
  })  : assert(file != null),
        assert(size >= 0);

  final File file;
  final int size;
}

class DownloadTaskOperation {
  DownloadTaskOperation({
    @required this.database,
    @required this.httpClient,
    @required this.client,
    @required this.task,
  })  : assert(database != null),
        assert(httpClient != null),
        assert(client != null),
        assert(task != null);

  static final _log = Logger('DownloadTaskOperation');

  final Database database;
  final http.Client httpClient;
  final EHentaiClient client;
  final DownloadTask task;

  int get galleryId => task.galleryId;

  final _galleryMemo = AsyncMemoizer<Gallery>();

  Future<Gallery> get _gallery => _galleryMemo.runOnce(() async {
        final entry = await database.galleriesDao.getEntry(galleryId);
        return Gallery.fromEntry(entry);
      });

  final _imageStoreMemo = AsyncMemoizer<ImageStore>();

  Future<ImageStore> get _imageStore =>
      _imageStoreMemo.runOnce(() async => ImageStore(
            client: client,
            gallery: await _gallery,
            galleriesDao: database.galleriesDao,
            downloadedImagesDao: database.downloadedImagesDao,
          ));

  final _directoryMemo = AsyncMemoizer<Directory>();

  Future<Directory> get _directory => _directoryMemo.runOnce(() async {
        final dir = await getGalleryDownloadDirectory(galleryId);
        await dir.create(recursive: true);
        return dir;
      });

  bool _canceled = false;
  Completer<void> _completer;
  String _thumbnailPath;

  Future<void> start() async {
    _log.fine('Start: $task');

    _completer = Completer();

    try {
      // Update the status as "downloading"
      await _guard(() => database.downloadTasksDao.updateSingleStatus(
            galleryId,
            state: DownloadTaskState.downloading,
          ));

      await _guard(_downloadThumbnail);

      // The notification must be displayed AFTER the thumbnail is downloaded.
      await _guard(() => _showDownloadingNotification(task.downloadedCount));

      for (int page = task.downloadedCount + 1;
          page <= task.totalCount && !_canceled;
          page++) {
        await _guard(() => _downloadImage(page));
      }

      // Update the status as "succeeded"
      await _guard(() => database.downloadTasksDao.updateSingleStatus(
            galleryId,
            state: DownloadTaskState.succeeded,
          ));

      await _guard(() => _showNotification(title: 'Downloaded successfully'));
    } on _CanceledException catch (_) {
      _log.finer('Canceled');
    } catch (err, stackTrace) {
      // Update the status as "failed"
      await database.downloadTasksDao.updateSingleStatus(
        galleryId,
        state: DownloadTaskState.failed,
        errorDetails: err.toString(),
      );

      await _showNotification(title: 'Download failed');

      // Record the error
      await FirebaseCrashlytics.instance.recordError(err, stackTrace);
      _log.severe('Failed to download the image', err, stackTrace);
      return;
    } finally {
      _completer.complete();
    }
  }

  Future<void> cancel() async {
    _log.fine('Cancel: $task');
    _canceled = true;
    await _completer?.future;
    await _showNotification(title: 'Download paused');
  }

  Future<T> _guard<T>(FutureOr<T> Function() fn) {
    if (_canceled) throw _CanceledException();
    return Future.sync(fn);
  }

  Future<_FileWithSize> _downloadFile({
    @required String name,
    @required String url,
  }) async {
    _log.finer('downloadFile: $url');

    final dir = await _directory;
    final file = File(p.join(dir.path, '$name${p.extension(url)}'));
    _log.finer('File path: ${file.path}');

    var fileSize = 0;
    final completer = Completer<void>();

    // Send the request
    final req = http.Request('GET', Uri.parse(url));
    final res = httpClient.send(req);

    res.asStream().listen((event) {
      _log.finer('Response status: ${event.statusCode}');

      // Check if the response status is ok
      if (event.statusCode != HttpStatus.ok) {
        completer.completeError(RequestException.fromBaseResponse(
          message: 'Failed to fetch image',
          response: event,
        ));
        return;
      }

      // Open a sink for writing
      final sink = file.openWrite();

      event.stream.listen((chunk) {
        // Write data to the sink
        sink.add(chunk);

        // Update the file size
        fileSize += chunk.length;
      }, onDone: () {
        // Close the sink
        completer.complete(sink.close());
      }, onError: completer.completeError);
    });

    // Wait until the stream is completed
    await completer.future;

    _log.finer('File size: $fileSize');

    return _FileWithSize(file: file, size: fileSize);
  }

  Future<void> _downloadThumbnail() async {
    if (task.thumbnail?.isNotEmpty ?? false) {
      _thumbnailPath = task.thumbnail;
      return;
    }

    final gallery = await _gallery;

    final file = await _guard(() => _downloadFile(
          name: 'thumbnail',
          url: gallery.thumbnail,
        ));

    _thumbnailPath = file.file.path;

    await _guard(() => database.downloadTasksDao.updateSingleStatus(
          galleryId,
          thumbnail: file.file.path,
        ));
  }

  Future<void> _downloadImage(int page) async {
    _log.fine('Download image: galleryId=$galleryId, page=$page');

    final imageStore = await _imageStore;

    // Load the image metadata
    final image = await _guard(() => imageStore.loadNetworkPage(page));

    _log.finer('Get image metadata: $image');

    final file = await _guard(() => _downloadFile(
          name: '$page',
          url: image.url,
        ));

    // Upsert the downloaded image to the database
    await _guard(
        () => database.downloadedImagesDao.upsertEntry(DownloadedImageEntry(
              galleryId: task.galleryId,
              key: image.id.key,
              page: page,
              downloadedAt: DateTime.now(),
              width: image.width,
              height: image.height,
              size: file.size,
              path: file.file.path,
            )));

    // Update the downloaded count
    await _guard(() => database.downloadTasksDao.updateSingleStatus(
          galleryId,
          downloadedCount: page,
        ));

    // Show the notification
    await _guard(() => _showDownloadingNotification(page));
  }

  Future<void> _showNotification({
    @required String title,
    int downloadedCount,
    bool showProgress = false,
  }) async {
    final androidDetails = AndroidNotificationDetails(
      'download',
      'Download',
      'Download progress',
      icon: 'download',
      playSound: false,
      enableVibration: false,
      largeIcon: FilePathAndroidBitmap(_thumbnailPath),
      category: 'progress',
      onlyAlertOnce: true,
      maxProgress: task.totalCount,
      progress: downloadedCount,
      channelShowBadge: false,
      showProgress: showProgress,
    );
    const iosDetails = IOSNotificationDetails(presentSound: false);
    final details = NotificationDetails(androidDetails, iosDetails);
    final gallery = await _gallery;

    await notificationPlugin.show(
      galleryId,
      title,
      gallery.title,
      details,
      payload: '/home/download',
    );
  }

  Future<void> _showDownloadingNotification(int downloadedCount) {
    return _showNotification(
      title: 'Downloading',
      downloadedCount: downloadedCount,
      showProgress: true,
    );
  }
}

class DownloadTaskHandler {
  DownloadTaskHandler({
    @required this.database,
  }) : assert(database != null) {
    final sessionStore = SessionStore();
    _httpClient = http.Client();
    _client = EHentaiClient(
      httpClient: _httpClient,
      sessionStore: sessionStore,
    );
  }

  static final _log = Logger('DownloadTaskHandler');

  final Database database;
  http.Client _httpClient;
  EHentaiClient _client;
  final _operations = <int, DownloadTaskOperation>{};
  bool _canceled = false;

  Future<bool> handle(Map<String, dynamic> inputData) async {
    _log.fine('handle: $inputData');

    final listener = DownloadInterruptListener(
      onInterrupt: (galleryId) async {
        _log.finer('onInterrupt: $galleryId');
        await _operations[galleryId]?.cancel();
      },
      onInterruptAll: () async {
        _log.finer('onInterruptAll');
        _canceled = true;
        await Future.wait(_operations.values.map((value) => value.cancel()));
      },
    );

    try {
      DownloadTask task;

      while (!_canceled && (task = await _nextTask()) != null) {
        final operation = _operations[task.galleryId] = DownloadTaskOperation(
          database: database,
          httpClient: _httpClient,
          client: _client,
          task: task,
        );

        try {
          await operation.start();
        } finally {
          _operations.remove(task.galleryId);
        }
      }
    } catch (err, stackTrace) {
      _log.severe('Operation error', err, stackTrace);
      FirebaseCrashlytics.instance.recordError(err, stackTrace);
      return false;
    } finally {
      await listener.close();
    }

    return true;
  }

  Future<DownloadTask> _nextTask() async {
    final task = await database.downloadTasksDao.nextPendingTask();
    _log.finer('Next task: $task');
    return task;
  }
}
