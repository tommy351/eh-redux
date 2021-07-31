import 'package:freezed_annotation/freezed_annotation.dart';

part 'types.freezed.dart';

@freezed
class SearchArguments with _$SearchArguments {
  const factory SearchArguments({
    @Default('') String query,
  }) = _SearchArguments;
}
