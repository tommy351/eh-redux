import 'package:freezed_annotation/freezed_annotation.dart';

part 'favorite.freezed.dart';

@freezed
abstract class FavoriteStatus with _$FavoriteStatus {
  const factory FavoriteStatus({
    @required int favorite,
    @required String note,
  }) = _FavoriteStatus;
}
