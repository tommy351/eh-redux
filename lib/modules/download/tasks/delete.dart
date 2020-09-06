import 'package:eh_redux/database/database.dart';
import 'package:eh_redux/modules/download/types.dart';
import 'package:eh_redux/modules/download/utils.dart';
import 'package:logging/logging.dart';

class DeleteDownloadTaskHandler {
  DeleteDownloadTaskHandler() {
    _database = Database();
  }

  static final _log = Logger('DeleteDownloadTaskHandler');

  Database _database;

  Future<void> dispose() async {
    await _database?.close();
  }

  Future<bool> handle(Map<String, dynamic> inputData) async {
    _log.finer('Handle: $inputData');

    try {
      final galleryId = inputData['galleryId'] as int;
      final task = await _database.downloadTasksDao.getSingle(galleryId);

      if (task == null) {
        _log.finer('Stop because the download task is deleted');
        return true;
      }

      if (task.state != DownloadTaskState.deleting) {
        _log.warning('The status must be "deleting"');
        return true;
      }

      // Delete files
      final dir = await getGalleryDownloadDirectory(galleryId);

      if (await dir.exists()) {
        await dir.delete(recursive: true);
      }

      // Delete downloaded images of the task
      await _database.downloadedImagesDao.deleteByGalleryId(galleryId);

      // Delete the download task
      await _database.downloadTasksDao.deleteByGalleryId(galleryId);

      return true;
    } finally {
      await dispose();
    }
  }
}
