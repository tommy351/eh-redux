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
    int width,
    int height,
    @required String url,
    String reloadKey,
  }) = _Image;
}

@freezed
abstract class ImageLoadOptions implements _$ImageLoadOptions {
  const factory ImageLoadOptions({
    @required GalleryId galleryId,
    @required int page,
    String reloadKey,
  }) = _ImageLoadOptions;

  const ImageLoadOptions._();

  GalleryIdWithPage get galleryIdWithPage => GalleryIdWithPage(
        galleryId: galleryId,
        page: page,
      );
}
