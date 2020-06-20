import 'package:eh_redux/models/gallery.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'args.freezed.dart';

@freezed
abstract class GalleryScreenArguments with _$GalleryScreenArguments {
  const factory GalleryScreenArguments({
    @required GalleryId id,
  }) = _GalleryScreenArguments;
}
