import 'dart:async';
import 'dart:io';

import 'package:eh_redux/database/database.dart';
import 'package:eh_redux/modules/download/progress.dart';
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

  Future<bool> handle(Map<String, dynamic> inputData) async {
    _log.finer('Handle: $inputData');

    DownloadTask task;

    while ((task = await database.downloadTasksDao.nextPendingTask()) != null) {
      await _handleTask(task);
    }

    return true;
  }

  Future<void> _updateTaskStatus({
    @required int galleryId,
    @required DownloadTaskState state,
    int downloadedCount,
    DateTime queuedAt,
    String errorDetails,
  }) async {
    await database.downloadTasksDao.updateSingleStatus(
      galleryId,
      state: state,
      downloadedCount: downloadedCount,
      queuedAt: queuedAt,
      errorDetails: errorDetails,
    );

    publishDownloadProgress(DownloadTaskProgress(
      galleryId: galleryId,
      state: state,
      downloadedCount: downloadedCount,
    ));
  }

  Future<void> _handleTask(DownloadTask task) async {
    _log.finer('Handle download task: $task');

    // Update the status as "downloading"
    await _updateTaskStatus(
      galleryId: task.galleryId,
      state: DownloadTaskState.downloading,
    );

    // Create the folder
    final directory = await getGalleryDownloadDirectory(task.galleryId);
    await directory.create(recursive: true);

    final gallery = await database.galleriesDao.getEntry(task.galleryId);
    final imageStore = ImageStore(
      client: _client,
      gallery: Gallery.fromEntry(gallery),
      galleriesDao: database.galleriesDao,
      downloadedImagesDao: database.downloadedImagesDao,
    );

    for (int page = task.downloadedCount + 1; page <= task.totalCount; page++) {
      try {
        await _downloadImage(
          directory: directory,
          task: task,
          imageStore: imageStore,
          page: page,
        );

        // Check the latest status of the task
        final currentTask =
            await database.downloadTasksDao.getSingle(task.galleryId);

        if (currentTask == null) {
          _log.finer('Stop because the download task is deleted');
          return;
        }

        if (currentTask.state == DownloadTaskState.deleting) {
          _log.finer('Stop because the download task is deleting');
          return;
        }

        // Update the downloaded count
        await _updateTaskStatus(
          galleryId: task.galleryId,
          state: currentTask.state,
          downloadedCount: page,
        );

        // Stop if the task is paused
        if (currentTask.state == DownloadTaskState.paused) {
          _log.finer('Stop because the download task is paused');
          return;
        }
      } catch (err, stackTrace) {
        // TODO: Retry with the reload key

        // Update the status as "failed"
        await _updateTaskStatus(
          galleryId: task.galleryId,
          state: DownloadTaskState.failed,
          errorDetails: err.toString(),
        );

        // Record the error
        await FirebaseCrashlytics.instance.recordError(err, stackTrace);
        _log.severe('Failed to download the image', err, stackTrace);
        return;
      }
    }

    // Update the status as "succeeded"
    await _updateTaskStatus(
      galleryId: task.galleryId,
      state: DownloadTaskState.succeeded,
    );
  }

  Future<void> _downloadImage({
    @required Directory directory,
    @required DownloadTask task,
    @required ImageStore imageStore,
    @required int page,
  }) async {
    _log.finer('Download the image: galleryId=${task.galleryId}, page=$page');

    // Load the image metadata
    final image = await imageStore.loadNetworkPage(page);

    _log.finer('Get image metadata: $image');

    final uri = Uri.parse(image.url);

    // Create a File for the image
    final file = File(p.join(
      directory.path,
      page.toString() + p.extension(image.url),
    ));

    _log.finer('File path: ${file.path}');

    var fileSize = 0;
    final completer = Completer<void>();

    // Send the request
    final req = http.Request('GET', uri);
    final res = _httpClient.send(req);

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
  }
}
