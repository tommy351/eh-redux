import 'package:eh_redux/modules/download/daos/task.dart';
import 'package:eh_redux/modules/download/types.dart';
import 'package:eh_redux/modules/gallery/dao.dart';
import 'package:eh_redux/modules/gallery/types.dart';
import 'package:eh_redux/tasks/handler.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:logging/logging.dart';
import 'package:meta/meta.dart';
import 'package:workmanager/workmanager.dart';

class DownloadController {
  DownloadController({
    @required this.downloadTasksDao,
    @required this.galleriesDao,
  });

  static const _taskUniqueName = 'download';
  static final _log = Logger('DownloadController');

  final DownloadTasksDao downloadTasksDao;
  final GalleriesDao galleriesDao;

  Future<void> _registerTask() async {
    _log.finer('Register download task to work manager');

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
    _log.finer('Create a download task: $gallery');

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
    _log.finer('Pause the download task: $galleryId');

    await downloadTasksDao.updateSingleStatus(
      galleryId,
      state: DownloadTaskState.paused,
    );
  }

  Future<void> pauseAll() async {
    _log.finer('Pause all download tasks');

    await downloadTasksDao.updateAllStatus(
      state: DownloadTaskState.paused,
      stateIsIn: [DownloadTaskState.downloading],
    );
  }

  Future<void> resume(int galleryId) async {
    _log.finer('Resume the download task: $galleryId');

    await downloadTasksDao.updateSingleStatus(
      galleryId,
      state: DownloadTaskState.pending,
      queuedAt: DateTime.now(),
    );

    await _registerTask();
  }

  Future<void> resumeAll() async {
    _log.finer('Resumse all download tasks');

    await downloadTasksDao.updateAllStatus(
      state: DownloadTaskState.pending,
      queuedAt: DateTime.now(),
    );

    await _registerTask();
  }

  Future<void> delete(int galleryId) async {
    _log.finer('Delete the download task: $galleryId');

    await downloadTasksDao.updateSingleStatus(
      galleryId,
      state: DownloadTaskState.deleting,
    );

    await Workmanager.registerOneOffTask(
      'deleteDownload_$galleryId',
      EnumToString.parse(TaskTag.deleteDownload),
      existingWorkPolicy: ExistingWorkPolicy.keep,
      tag: EnumToString.parse(TaskTag.deleteDownload),
      inputData: {
        'galleryId': galleryId,
      },
    );
  }
}
