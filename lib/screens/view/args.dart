import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ehreader/models/gallery.dart';

part 'args.g.dart';

abstract class ViewScreenArguments
    implements Built<ViewScreenArguments, ViewScreenArgumentsBuilder> {
  static Serializer<ViewScreenArguments> get serializer =>
      _$viewScreenArgumentsSerializer;

  GalleryId get id;

  factory ViewScreenArguments([Function(ViewScreenArgumentsBuilder) updates]) =
      _$ViewScreenArguments;
  ViewScreenArguments._();
}
