import 'dart:collection';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'pagination.g.dart';

abstract class Pagination<T>
    implements Built<Pagination<T>, PaginationBuilder<T>> {
  static Serializer<Pagination<Object>> get serializer =>
      _$paginationSerializer;

  BuiltSet<T> get index;
  bool get loading;
  bool get noMore;
  int get currentPage;

  factory Pagination([Function(PaginationBuilder<T>) updates]) =
      _$Pagination<T>;
  Pagination._();
}

abstract class PaginationBuilder<T>
    implements Builder<Pagination<T>, PaginationBuilder<T>> {
  BuiltSet<T> index =
      (SetBuilder<T>()..withBase(() => LinkedHashSet<T>())).build();
  bool loading = false;
  bool noMore = false;
  int currentPage = -1;

  factory PaginationBuilder() = _$PaginationBuilder<T>;
  PaginationBuilder._();
}
