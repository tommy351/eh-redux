import 'package:freezed_annotation/freezed_annotation.dart';

part 'args.freezed.dart';

@freezed
abstract class SearchScreenArguments with _$SearchScreenArguments {
  const factory SearchScreenArguments({
    @Default('') String query,
  }) = _SearchScreenArguments;
}
