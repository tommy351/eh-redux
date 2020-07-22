import 'dart:async';

import 'package:eh_redux/models/download.dart';
import 'package:eh_redux/tables/download_task.dart';
import 'package:eh_redux/tasks/handler.dart';
import 'package:meta/meta.dart';
import 'package:mobx/mobx.dart';
import 'package:workmanager/workmanager.dart';

part 'download.g.dart';

class DownloadStore = _DownloadStoreBase with _$DownloadStore;

abstract class _DownloadStoreBase with Store {
  _DownloadStoreBase({
    @required this.downloadTasksDao,
  });

  final DownloadTasksDao downloadTasksDao;

  @observable
  ObservableMap<int, DownloadTask> data = ObservableMap.of({});

  @action
  Future<void> loadOne(int galleryId) async {
    await downloadTasksDao.getEntry(galleryId);
  }

  StreamSubscription watchOne(int galleryId) {
    final stream = downloadTasksDao.watchEntry(galleryId);

    return stream.listen((entry) {
      if (entry != null) {
        _setTasks([DownloadTask.fromEntry(entry)]);
      }
    });
  }

  StreamSubscription watchAll() {
    final stream = downloadTasksDao.watchEntries().map((entries) =>
        entries.map((entry) => DownloadTask.fromEntry(entry)).toList());

    return stream.listen((tasks) {
      _setTasks(tasks);
    });
  }

  @action
  void _setTasks(Iterable<DownloadTask> tasks) {
    for (final task in tasks) {
      data[task.galleryId] = task;
    }
  }

  @action
  Future<void> start(DownloadTask task) async {
    await downloadTasksDao.insertIfNotExist(task.toEntry());
    await Workmanager.registerOneOffTask(
      getTaskUniqueName(task),
      downloadTaskKey,
      tag: downloadTaskTag,
      existingWorkPolicy: ExistingWorkPolicy.keep,
      constraints: Constraints(
        networkType: NetworkType.connected,
      ),
      inputData: {
        'galleryId': task.galleryId,
      },
    );
  }

  @action
  Future<void> pause(DownloadTask task) async {
    await cancelTask(task);
    await downloadTasksDao.updateStatus(
      task.galleryId,
      DownloadTaskState.paused,
    );
  }

  Future<void> cancelAll() async {
    await Workmanager.cancelByTag(downloadTaskTag);
  }

  Future<void> cancelTask(DownloadTask task) async {
    await Workmanager.cancelByUniqueName(getTaskUniqueName(task));
  }

  String getTaskUniqueName(DownloadTask task) {
    return 'gallery-${task.galleryId}';
  }
}
