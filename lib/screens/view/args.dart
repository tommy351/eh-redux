import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:eh_redux/models/gallery.dart';

part 'args.g.dart';

abstract class ViewScreenArguments
    implements Built<ViewScreenArguments, ViewScreenArgumentsBuilder> {
  factory ViewScreenArguments([Function(ViewScreenArgumentsBuilder) updates]) =
      _$ViewScreenArguments;
  ViewScreenArguments._();

  static Serializer<ViewScreenArguments> get serializer =>
      _$viewScreenArgumentsSerializer;

  GalleryId get id;
}
