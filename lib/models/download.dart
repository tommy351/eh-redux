import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:eh_redux/tables/database.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'gallery.dart';

part 'download.freezed.dart';
part 'download.g.dart';

class DownloadTaskState extends EnumClass {
  const DownloadTaskState._(String name) : super(name);

  static const DownloadTaskState created = _$created;
  static const DownloadTaskState started = _$started;
  static const DownloadTaskState paused = _$paused;
  static const DownloadTaskState failed = _$failed;
  static const DownloadTaskState succeeded = _$succeeded;

  static BuiltSet<DownloadTaskState> get values => _$downloadTaskStateValues;
  static DownloadTaskState valueOf(String name) =>
      _$downloadTaskStateValueOf(name);
}

@freezed
abstract class DownloadTask implements _$DownloadTask {
  const factory DownloadTask({
    @required int galleryId,
    @Default(DownloadTaskState.created) DownloadTaskState state,
    @Default(0) int current,
    @required int total,
    @required DateTime createdAt,
  }) = _DownloadTask;

  const DownloadTask._();

  factory DownloadTask.fromGallery(Gallery gallery) {
    return DownloadTask(
      galleryId: gallery.id.id,
      total: gallery.fileCount,
      createdAt: DateTime.now(),
    );
  }

  factory DownloadTask.fromEntry(DownloadTaskEntry entry) {
    return DownloadTask(
      galleryId: entry.galleryId,
      state: DownloadTaskState.valueOf(entry.state),
      current: entry.current,
      total: entry.total,
      createdAt: entry.createdAt,
    );
  }

  DownloadTaskEntry toEntry() {
    return DownloadTaskEntry(
      galleryId: galleryId,
      state: state.toString(),
      current: current,
      total: total,
      createdAt: createdAt,
    );
  }
}

@freezed
abstract class DownloadedImage implements _$DownloadedImage {
  const factory DownloadedImage({
    @required int galleryId,
    @required int imagePage,
    @required int width,
    @required int height,
    @required int size,
    @required String path,
    @required DateTime downloadedAt,
  }) = _DownloadedImage;

  const DownloadedImage._();

  factory DownloadedImage.fromEntry(DownloadedImageEntry entry) {
    return DownloadedImage(
      galleryId: entry.galleryId,
      imagePage: entry.imagePage,
      width: entry.width,
      height: entry.height,
      size: entry.size,
      path: entry.path,
      downloadedAt: entry.downloadedAt,
    );
  }

  DownloadedImageEntry toEntry() {
    return DownloadedImageEntry(
      galleryId: galleryId,
      imagePage: imagePage,
      width: width,
      height: height,
      size: size,
      path: path,
      downloadedAt: downloadedAt,
    );
  }
}
