import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:eh_redux/models/gallery.dart';

part 'image.g.dart';

abstract class ImageId implements Built<ImageId, ImageIdBuilder> {
  static Serializer<ImageId> get serializer => _$imageIdSerializer;

  GalleryId get galleryId;
  int get page;
  String get key;

  factory ImageId([Function(ImageIdBuilder) updates]) = _$ImageId;
  ImageId._();
}

abstract class Image implements Built<Image, ImageBuilder> {
  static Serializer<Image> get serializer => _$imageSerializer;

  ImageId get id;
  int get width;
  int get height;
  String get url;

  factory Image([Function(ImageBuilder) updates]) = _$Image;
  Image._();
}
