import 'package:eh_redux/models/gallery.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'image.freezed.dart';

@freezed
abstract class ImageId with _$ImageId {
  const factory ImageId({
    @required GalleryId galleryId,
    @required int page,
    @required String key,
  }) = _ImageId;
}

@freezed
abstract class Image with _$Image {
  const factory Image({
    @required ImageId id,
    @required int width,
    @required int height,
    @required String url,
  }) = _Image;
}
