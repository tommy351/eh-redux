// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SearchStore on _SearchStoreBase, Store {
  final _$queryAtom = Atom(name: '_SearchStoreBase.query');

  @override
  String get query {
    _$queryAtom.reportRead();
    return super.query;
  }

  @override
  set query(String value) {
    _$queryAtom.reportWrite(value, super.query, () {
      super.query = value;
    });
  }

  final _$paginationKeyAtom = Atom(name: '_SearchStoreBase.paginationKey');

  @override
  GalleryPaginationKeySearch get paginationKey {
    _$paginationKeyAtom.reportRead();
    return super.paginationKey;
  }

  @override
  set paginationKey(GalleryPaginationKeySearch value) {
    _$paginationKeyAtom.reportWrite(value, super.paginationKey, () {
      super.paginationKey = value;
    });
  }

  final _$categoryFilterAtom = Atom(name: '_SearchStoreBase.categoryFilter');

  @override
  int get categoryFilter {
    _$categoryFilterAtom.reportRead();
    return super.categoryFilter;
  }

  @override
  set categoryFilter(int value) {
    _$categoryFilterAtom.reportWrite(value, super.categoryFilter, () {
      super.categoryFilter = value;
    });
  }

  final _$_SearchStoreBaseActionController =
      ActionController(name: '_SearchStoreBase');

  @override
  void setQuery(String value) {
    final _$actionInfo = _$_SearchStoreBaseActionController.startAction(
        name: '_SearchStoreBase.setQuery');
    try {
      return super.setQuery(value);
    } finally {
      _$_SearchStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCategoryFilter(int value) {
    final _$actionInfo = _$_SearchStoreBaseActionController.startAction(
        name: '_SearchStoreBase.setCategoryFilter');
    try {
      return super.setCategoryFilter(value);
    } finally {
      _$_SearchStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updatePaginationKey() {
    final _$actionInfo = _$_SearchStoreBaseActionController.startAction(
        name: '_SearchStoreBase.updatePaginationKey');
    try {
      return super.updatePaginationKey();
    } finally {
      _$_SearchStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
query: ${query},
paginationKey: ${paginationKey},
categoryFilter: ${categoryFilter}
    ''';
  }
}
