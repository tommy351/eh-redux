import 'package:eh_redux/modules/gallery/types.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'types.freezed.dart';

@freezed
class ImageId with _$ImageId {
  factory ImageId({
    required GalleryId galleryId,
    required int page,
    required String key,
  }) = _ImageId;

  const ImageId._();

  String get path => '/s/$key/${galleryId.id}-$page';
}

@freezed
class GalleryImage with _$GalleryImage {
  const factory GalleryImage.network({
    required ImageId id,
    required int width,
    required int height,
    required String url,
    String? reloadKey,
  }) = NetworkGalleryImage;

  const factory GalleryImage.local({
    required ImageId id,
    required int width,
    required int height,
    required String path,
  }) = LocalGalleryImage;
}
