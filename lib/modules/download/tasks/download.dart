import 'dart:async';
import 'dart:io';

import 'package:eh_redux/database/database.dart';
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
  DownloadTaskHandler() {
    final sessionStore = SessionStore();
    _database = Database();
    _httpClient = http.Client();
    _client = EHentaiClient(
      httpClient: _httpClient,
      sessionStore: sessionStore,
    );
  }

  static final _log = Logger('DownloadTaskHandler');

  http.Client _httpClient;
  EHentaiClient _client;
  Database _database;

  Future<void> dispose() async {
    await _database?.close();
  }

  Future<bool> handle(Map<String, dynamic> inputData) async {
    _log.finer('Handle: $inputData');

    try {
      DownloadTask task;

      while (
          (task = await _database.downloadTasksDao.nextPendingTask()) != null) {
        await _handleTask(task);
      }

      return true;
    } finally {
      await dispose();
    }
  }

  Future<void> _handleTask(DownloadTask task) async {
    _log.finer('Handle download task: $task');

    // Update the status as "downloading"
    await _database.downloadTasksDao.updateSingleStatus(
      task.galleryId,
      state: DownloadTaskState.downloading,
    );

    // Create the folder
    final directory = await getGalleryDownloadDirectory(task.galleryId);
    await directory.create(recursive: true);

    final gallery = await _database.galleriesDao.getEntry(task.galleryId);
    final imageStore = ImageStore(
      client: _client,
      gallery: Gallery.fromEntry(gallery),
      galleriesDao: _database.galleriesDao,
      downloadedImagesDao: _database.downloadedImagesDao,
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
            await _database.downloadTasksDao.getSingle(task.galleryId);

        if (currentTask == null) {
          _log.finer('Stop because the download task is deleted');
          return;
        }

        if (currentTask.state == DownloadTaskState.deleting) {
          _log.finer('Stop because the download task is deleting');
          return;
        }

        // Update the downloaded count
        await _database.downloadTasksDao.updateSingleStatus(
          task.galleryId,
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
        await _database.downloadTasksDao.updateSingleStatus(
          task.galleryId,
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
    await _database.downloadTasksDao.updateSingleStatus(
      task.galleryId,
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
    await _database.downloadedImagesDao.upsertEntry(DownloadedImageEntry(
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
