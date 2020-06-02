// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ViewStore on _ViewStoreBase, Store {
  final _$currentPageAtom = Atom(name: '_ViewStoreBase.currentPage');

  @override
  int get currentPage {
    _$currentPageAtom.reportRead();
    return super.currentPage;
  }

  @override
  set currentPage(int value) {
    _$currentPageAtom.reportWrite(value, super.currentPage, () {
      super.currentPage = value;
    });
  }

  final _$_ViewStoreBaseActionController =
      ActionController(name: '_ViewStoreBase');

  @override
  void setPage(int page) {
    final _$actionInfo = _$_ViewStoreBaseActionController.startAction(
        name: '_ViewStoreBase.setPage');
    try {
      return super.setPage(page);
    } finally {
      _$_ViewStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentPage: ${currentPage}
    ''';
  }
}
