import 'package:eh_redux/modules/gallery/dao.dart';
import 'package:eh_redux/modules/gallery/types.dart';
import 'package:eh_redux/tasks/handler.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:logging/logging.dart';
import 'package:meta/meta.dart';
import 'package:workmanager/workmanager.dart';

import 'daos/image.dart';
import 'daos/task.dart';
import 'interrupter.dart';
import 'types.dart';
import 'utils.dart';

class DownloadController {
  DownloadController({
    @required this.downloadTasksDao,
    @required this.downloadedImagesDao,
    @required this.galleriesDao,
  });

  static const _taskUniqueName = 'download';
  static final _log = Logger('DownloadController');

  final _interrupter = DownloadInterrupter();
  final DownloadTasksDao downloadTasksDao;
  final DownloadedImagesDao downloadedImagesDao;
  final GalleriesDao galleriesDao;

  Future<void> _registerTask() async {
    _log.fine('Register download task to work manager');

    await Workmanager.registerOneOffTask(
      _taskUniqueName,
      EnumToString.parse(TaskTag.download),
      existingWorkPolicy: ExistingWorkPolicy.keep,
      constraints: Constraints(
        networkType: NetworkType.connected,
      ),
    );
  }

  Future<void> create(Gallery gallery) async {
    _log.fine('create: $gallery');

    final now = DateTime.now();

    // Upsert the gallery to the database
    await galleriesDao.upsertEntry(gallery.toEntry());

    // Insert the download task to the database
    await downloadTasksDao.insertSingle(DownloadTask(
      galleryId: gallery.id,
      totalCount: gallery.fileCount,
      createdAt: now,
      queuedAt: now,
    ));

    await _registerTask();
  }

  Future<void> pause(int galleryId) async {
    _log.fine('pause: $galleryId');

    await _interrupter.interrupt(galleryId);

    await downloadTasksDao.updateSingleStatus(
      galleryId,
      state: DownloadTaskState.paused,
    );
  }

  Future<int> pauseAll() async {
    _log.fine('pauseAll');

    await _interrupter.interruptAll();

    final updated = await downloadTasksDao.updateAllStatus(
      state: DownloadTaskState.paused,
      stateIsIn: [
        DownloadTaskState.pending,
        DownloadTaskState.downloading,
      ],
    );

    _log.finer('Updated count: $updated');

    return updated;
  }

  Future<void> resume(int galleryId) async {
    _log.fine('resume: $galleryId');

    await downloadTasksDao.updateSingleStatus(
      galleryId,
      state: DownloadTaskState.pending,
      queuedAt: DateTime.now(),
    );

    await _registerTask();
  }

  Future<int> resumeAll() async {
    _log.fine('resumeAll');

    final updated = await downloadTasksDao.updateAllStatus(
      state: DownloadTaskState.pending,
      queuedAt: DateTime.now(),
      stateIsIn: [DownloadTaskState.paused],
    );

    _log.finer('Updated count: $updated');

    if (updated > 0) {
      await _registerTask();
    }

    return updated;
  }

  Future<void> delete(int galleryId) async {
    _log.fine('delete: $galleryId');

    await _interrupter.interrupt(galleryId);

    await downloadTasksDao.updateSingleStatus(
      galleryId,
      state: DownloadTaskState.deleting,
    );

    // Delete downloaded images of the task
    await downloadedImagesDao.deleteByGalleryId(galleryId);

    // Delete files
    final dir = await getGalleryDownloadDirectory(galleryId);

    if (await dir.exists()) {
      _log.finer('Deleting download directory: $dir');
      await dir.delete(recursive: true);
    }

    // Delete the download task
    await downloadTasksDao.deleteByGalleryId(galleryId);
  }
}
