import 'dart:collection';

import 'package:built_collection/built_collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination.freezed.dart';

@freezed
abstract class Pagination<T> with _$Pagination<T> {
  const factory Pagination({
    @required BuiltSet<T> index,
    @Default(false) bool loading,
    @Default(false) bool noMore,
    @Default(-1) int currentPage,
  }) = _Pagination<T>;
}

BuiltSet<T> newEmptyPaginationIndex<T>() {
  final builder = SetBuilder<T>()..withBase(() => LinkedHashSet<T>());
  return builder.build();
}
