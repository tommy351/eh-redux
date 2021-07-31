import 'package:eh_redux/database/database.dart';
import 'package:eh_redux/modules/gallery/types.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'types.freezed.dart';

enum DownloadTaskState {
  pending,
  downloading,
  paused,
  failed,
  succeeded,
  deleting,
}

@freezed
class DownloadTask with _$DownloadTask {
  const factory DownloadTask({
    required int galleryId,
    required int totalCount,
    @Default(0) int downloadedCount,
    required DateTime createdAt,
    required DateTime queuedAt,
    @Default(DownloadTaskState.pending) DownloadTaskState state,
    String? errorDetails,
    String? thumbnail,
  }) = _DownloadTask;

  factory DownloadTask.fromEntry(DownloadTaskEntry entry) {
    return DownloadTask(
      galleryId: entry.galleryId,
      totalCount: entry.totalCount,
      downloadedCount: entry.downloadedCount,
      createdAt: entry.createdAt,
      queuedAt: entry.queuedAt,
      state: entry.state,
      errorDetails: entry.errorDetails,
      thumbnail: entry.thumbnail,
    );
  }

  const DownloadTask._();

  DownloadTaskEntry toEntry() {
    return DownloadTaskEntry(
      galleryId: galleryId,
      totalCount: totalCount,
      downloadedCount: downloadedCount,
      createdAt: createdAt,
      queuedAt: queuedAt,
      state: state,
      errorDetails: errorDetails,
      thumbnail: thumbnail,
    );
  }
}

@freezed
class DownloadTaskWithGallery with _$DownloadTaskWithGallery {
  const factory DownloadTaskWithGallery({
    required DownloadTask task,
    required Gallery gallery,
  }) = _DownloadTaskWithGallery;

  factory DownloadTaskWithGallery.fromEntry({
    required DownloadTaskEntry task,
    required GalleryEntry gallery,
  }) {
    return DownloadTaskWithGallery(
      task: DownloadTask.fromEntry(task),
      gallery: Gallery.fromEntry(gallery),
    );
  }
}
