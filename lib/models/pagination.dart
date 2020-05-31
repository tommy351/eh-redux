import 'dart:collection';

import 'package:built_collection/built_collection.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class Pagination<T> extends Equatable {
  final BuiltSet<T> index;
  final bool loading;
  final bool noMore;
  final int currentPage;

  Pagination({
    BuiltSet<T> index,
    this.loading = false,
    this.noMore = false,
    this.currentPage = -1,
  }) : this.index = index ?? BuiltSet.from(LinkedHashSet());

  Pagination<T> copyWith({
    BuiltSet<T> index,
    bool loading,
    bool noMore,
    int currentPage,
  }) {
    return Pagination<T>(
      index: index ?? this.index,
      loading: loading ?? this.loading,
      noMore: noMore ?? this.noMore,
      currentPage: currentPage ?? this.currentPage,
    );
  }

  @override
  List<Object> get props => [index, loading, noMore, currentPage];
}
