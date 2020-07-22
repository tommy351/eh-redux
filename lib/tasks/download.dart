import 'dart:developer' as developer;
import 'dart:io';

import 'package:eh_redux/models/download.dart';
import 'package:eh_redux/models/gallery.dart';
import 'package:eh_redux/models/image.dart';
import 'package:eh_redux/models/request_exception.dart';
import 'package:eh_redux/repositories/ehentai_client.dart';
import 'package:eh_redux/stores/image.dart';
import 'package:eh_redux/stores/session.dart';
import 'package:eh_redux/tables/database.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

class DownloadTaskHandler {
  DownloadTaskHandler() {
    final sessionStore = SessionStore(
      secureStorage: const FlutterSecureStorage(),
    );
    _client = EHentaiClient(
      httpClient: http.Client(),
      sessionStore: sessionStore,
    );
    _database = Database();
    _imageStore = ImageStore(client: _client);
  }

  Directory _downloadDir;
  EHentaiClient _client;
  Database _database;
  ImageStore _imageStore;
  Gallery _gallery;
  DownloadTask _task;

  Future<bool> handle(Map<String, dynamic> inputData) async {
    developer.log('Received download task: $inputData');

    _downloadDir = await getApplicationDocumentsDirectory();

    final galleryId = inputData['galleryId'] as int;
    final taskEntry = await _database.downloadTasksDao.getEntry(galleryId);
    final galleryEntry = await _database.galleriesDao.getEntry(galleryId);

    if (taskEntry == null || galleryEntry == null) {
      return false;
    }

    _task = DownloadTask.fromEntry(taskEntry);
    _gallery = Gallery.fromEntry(galleryEntry);

    developer.log('Handle download task: $_task');

    if (_task.state == DownloadTaskState.succeeded) {
      return true;
    }

    await _database.downloadTasksDao
        .updateStatus(galleryId, DownloadTaskState.started);

    for (int i = _task.current + 1; i <= _task.total; i++) {
      try {
        await _downloadPage(i);
      } catch (err) {
        await _database.downloadTasksDao
            .updateStatus(galleryId, DownloadTaskState.failed);
        rethrow;
      }
    }

    await _database.downloadTasksDao.updateStatus(
      galleryId,
      DownloadTaskState.succeeded,
      current: _task.total,
    );

    return true;
  }

  Future<void> _downloadPage(int page) async {
    final options = ImageLoadOptions(
      galleryId: _gallery.id,
      page: page,
    );

    await _imageStore.loadImage(options);

    final image = _imageStore.getImageByPage(options.galleryIdWithPage);
    final url = Uri.parse(image.url);
    final file = File(p.join(_downloadDir.path,
        '${_gallery.id.id}-$page.${p.extension(image.url)}'));

    final request = await HttpClient().getUrl(url);
    final response = await request.close();

    if (response.statusCode != HttpStatus.ok) {
      throw RequestException(
        message: 'Failed to fetch the image',
        statusCode: response.statusCode,
        method: request.method,
        url: request.uri,
      );
    }

    var fileSize = 0;
    final sink = file.openWrite();
    final subscription = response.listen((chunk) {
      sink.add(chunk);
      fileSize += chunk.length;
    });

    try {
      await subscription.asFuture();
    } finally {
      await subscription.cancel();
      await sink.close();
    }

    await _database.downloadedImagesDao.insertEntry(DownloadedImageEntry(
      galleryId: _gallery.id.id,
      imagePage: page,
      downloadedAt: DateTime.now(),
      width: image.width,
      height: image.height,
      size: fileSize,
      path: file.path,
    ));

    await _database.downloadTasksDao.updateStatus(
      _gallery.id.id,
      DownloadTaskState.started,
      current: page,
    );
  }
}
