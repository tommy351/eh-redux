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
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';
import 'package:meta/meta.dart';
import 'package:path/path.dart' as p;

class CanceledException {}

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

  Gallery _gallery;
  ImageStore _imageStore;
  Directory _directory;
  bool _canceled = false;
  StreamQueue<int> _queue;
  Completer<void> _completer;
  AsyncMemoizer<void> _queueCancelMemo;

  Future<void> start() async {
    _log.fine('Start: $task');

    _completer = Completer();

    try {
      // Create the folder
      _directory = await _guard(() => getGalleryDownloadDirectory(galleryId));
      await _guard(() => _directory.create(recursive: true));
      _log.finer('Created directory: $_directory');

      final galleryEntry =
          await _guard(() => database.galleriesDao.getEntry(galleryId));
      _gallery = Gallery.fromEntry(galleryEntry);
      _imageStore = ImageStore(
        client: client,
        gallery: _gallery,
        galleriesDao: database.galleriesDao,
        downloadedImagesDao: database.downloadedImagesDao,
      );

      // Update the status as "downloading"
      await _guard(() => database.downloadTasksDao.updateSingleStatus(
            galleryId,
            state: DownloadTaskState.downloading,
          ));

      await _guard(_startQueue);
    } on CanceledException catch (err) {
      _log.finer('Canceled: $err');
    } catch (err, stackTrace) {
      // Update the status as "failed"
      await database.downloadTasksDao.updateSingleStatus(
        galleryId,
        state: DownloadTaskState.failed,
        errorDetails: err.toString(),
      );

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
    await _cancelQueue(immediate: true);
    await _completer?.future;
  }

  Future<T> _guard<T>(FutureOr<T> Function() fn) {
    if (_canceled) throw CanceledException();
    return Future.sync(fn);
  }

  Future<void> _startQueue() async {
    final pages = List.generate(task.totalCount, (index) => index + 1)
        .skip(task.downloadedCount);
    _queue = StreamQueue(Stream.fromIterable(pages));
    _queueCancelMemo = AsyncMemoizer();

    try {
      while (await _guard(() => _queue.hasNext)) {
        final page = await _guard(() => _queue.next);
        await _guard(() => _downloadImage(page));
      }

      if (_queue.eventsDispatched == pages.length) {
        // Update the status as "succeeded"
        await database.downloadTasksDao.updateSingleStatus(
          galleryId,
          state: DownloadTaskState.succeeded,
        );
      }
    } finally {
      _cancelQueue();
    }
  }

  Future<void> _cancelQueue({bool immediate = false}) {
    return _queueCancelMemo?.runOnce(() => _queue.cancel(immediate: immediate));
  }

  Future<void> _downloadImage(int page) async {
    _log.fine('Download image: galleryId=$galleryId, page=$page');

    // Load the image metadata
    final image = await _guard(() => _imageStore.loadNetworkPage(page));

    _log.finer('Get image metadata: $image');

    final uri = Uri.parse(image.url);

    // Create a File for the image
    final file = File(p.join(
      _directory.path,
      page.toString() + p.extension(image.url),
    ));

    _log.finer('File path: ${file.path}');

    var fileSize = 0;
    final completer = Completer<void>();

    // Send the request
    final req = http.Request('GET', uri);
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

    // Upsert the downloaded image to the database
    await database.downloadedImagesDao.upsertEntry(DownloadedImageEntry(
      galleryId: task.galleryId,
      key: image.id.key,
      page: page,
      downloadedAt: DateTime.now(),
      width: image.width,
      height: image.height,
      size: fileSize,
      path: file.path,
    ));

    // Update the downloaded count
    await database.downloadTasksDao.updateSingleStatus(
      galleryId,
      downloadedCount: page,
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

  Future<bool> handle(Map<String, dynamic> inputData) async {
    _log.fine('handle: $inputData');

    final listener = DownloadInterruptListener((galleryId) async {
      await _operations[galleryId]?.cancel();
    });

    try {
      DownloadTask task;

      while ((task = await _nextTask()) != null) {
        final operation = _operations[task.galleryId] = DownloadTaskOperation(
          database: database,
          httpClient: _httpClient,
          client: _client,
          task: task,
        );

        await operation.start();
      }
    } finally {
      listener.close();
    }

    return true;
  }

  Future<DownloadTask> _nextTask() {
    return database.downloadTasksDao.nextPendingTask();
  }
}
