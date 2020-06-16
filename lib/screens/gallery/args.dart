import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:eh_redux/models/gallery.dart';

part 'args.g.dart';

abstract class GalleryScreenArguments
    implements Built<GalleryScreenArguments, GalleryScreenArgumentsBuilder> {
  factory GalleryScreenArguments(
          [Function(GalleryScreenArgumentsBuilder) updates]) =
      _$GalleryScreenArguments;
  GalleryScreenArguments._();

  static Serializer<GalleryScreenArguments> get serializer =>
      _$galleryScreenArgumentsSerializer;

  GalleryId get id;
}
