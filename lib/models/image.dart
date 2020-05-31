import 'package:ehreader/models/gallery.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class ImageId extends Equatable {
  final GalleryId galleryId;
  final int page;
  final String key;

  ImageId({
    @required this.galleryId,
    @required this.page,
    @required this.key,
  })  : assert(galleryId != null),
        assert(page != null),
        assert(key != null);

  @override
  List<Object> get props => [galleryId, page, key];

  @override
  String toString() =>
      'ImageId { galleryId: $galleryId, page: $page, key: $key }';
}

@immutable
class Image extends Equatable {
  final ImageId id;
  final int width;
  final int height;
  final String url;

  Image({
    @required this.id,
    this.width,
    this.height,
    this.url,
  }) : assert(id != null);

  @override
  List<Object> get props => [id, width, height, url];
}
