import 'package:eh_redux/models/gallery.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'args.freezed.dart';

@freezed
abstract class ViewScreenArguments with _$ViewScreenArguments {
  const factory ViewScreenArguments({
    @required GalleryId id,
  }) = _ViewScreenArguments;
}
