import 'package:eh_redux/models/gallery.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'content_warning_exception.freezed.dart';

@freezed
abstract class ContentWarningException with _$ContentWarningException {
  const factory ContentWarningException({
    @required GalleryId galleryId,
    @Default('') String reason,
  }) = _ContentWarningException;
}
