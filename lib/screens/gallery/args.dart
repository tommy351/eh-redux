import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ehreader/models/gallery.dart';

part 'args.g.dart';

abstract class GalleryScreenArguments
    implements Built<GalleryScreenArguments, GalleryScreenArgumentsBuilder> {
  static Serializer<GalleryScreenArguments> get serializer =>
      _$galleryScreenArgumentsSerializer;

  GalleryId get id;

  factory GalleryScreenArguments(
          [Function(GalleryScreenArgumentsBuilder) updates]) =
      _$GalleryScreenArguments;
  GalleryScreenArguments._();
}
