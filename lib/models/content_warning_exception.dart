import 'package:built_value/built_value.dart';
import 'package:eh_redux/models/gallery.dart';

part 'content_warning_exception.g.dart';

abstract class ContentWarningException
    implements Built<ContentWarningException, ContentWarningExceptionBuilder> {
  factory ContentWarningException(
          [void Function(ContentWarningExceptionBuilder) updates]) =
      _$ContentWarningException;
  ContentWarningException._();

  GalleryId get galleryId;
  String get reason;
}
