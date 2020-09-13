import 'dart:async';
import 'dart:isolate';
import 'dart:ui';

import 'package:eh_redux/modules/download/types.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

const _portName = 'downloadProgress';

void publishDownloadProgress(DownloadTaskProgress progress) {
  final port = IsolateNameServer.lookupPortByName(_portName);
  port?.send(progress);
}

class DownloadProgressListener {
  DownloadProgressListener() : _port = ReceivePort() {
    stream = _port.asBroadcastStream().cast<DownloadTaskProgress>();
    IsolateNameServer.registerPortWithName(_port.sendPort, _portName);
  }

  final ReceivePort _port;
  Stream<DownloadTaskProgress> stream;

  void dispose() {
    IsolateNameServer.removePortNameMapping(_portName);
    _port.close();
  }

  Stream<DownloadTask> mergeSingle(Stream<DownloadTask> task$) {
    return mergeList(task$.map((event) => [event])).map((event) => event.first);
  }

  Stream<List<T>> _mergeList<T>(
    Stream<List<T>> inputStream,
    T Function(T, DownloadTaskProgress) map,
  ) {
    final valueStream = inputStream.shareValue();

    return MergeStream<List<T>>([
      valueStream,
      stream.map((progress) {
        if (!valueStream.hasValue) return [];

        return valueStream.value.map((task) {
          return map(task, progress);
        }).toList();
      }),
    ]);
  }

  DownloadTask _combineWithProgress({
    @required DownloadTask task,
    DownloadTaskProgress progress,
  }) {
    if (progress == null || task.galleryId != progress.galleryId) return task;

    return task.copyWith(
      state: progress.state ?? task.state,
      downloadedCount: progress.downloadedCount ?? task.downloadedCount,
    );
  }

  Stream<List<DownloadTask>> mergeList(Stream<List<DownloadTask>> input) {
    return _mergeList(
      input,
      (task, progress) => _combineWithProgress(
        task: task,
        progress: progress,
      ),
    );
  }

  Stream<List<DownloadTaskWithGallery>> mergeListWithGallery(
    Stream<List<DownloadTaskWithGallery>> input,
  ) {
    return _mergeList(
      input,
      (task, progress) => task.copyWith(
        task: _combineWithProgress(
          task: task.task,
          progress: progress,
        ),
      ),
    );
  }
}
