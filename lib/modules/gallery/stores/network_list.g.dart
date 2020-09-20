// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_list.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NetworkGalleryListStore on _NetworkGalleryListStoreBase, Store {
  final _$dataAtom = Atom(name: '_NetworkGalleryListStoreBase.data');

  @override
  ObservableMap<int, Gallery> get data {
    _$dataAtom.reportRead();
    return super.data;
  }

  @override
  set data(ObservableMap<int, Gallery> value) {
    _$dataAtom.reportWrite(value, super.data, () {
      super.data = value;
    });
  }

  final _$currentPageAtom =
      Atom(name: '_NetworkGalleryListStoreBase.currentPage');

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

  final _$loadingAtom = Atom(name: '_NetworkGalleryListStoreBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$hasMoreAtom = Atom(name: '_NetworkGalleryListStoreBase.hasMore');

  @override
  bool get hasMore {
    _$hasMoreAtom.reportRead();
    return super.hasMore;
  }

  @override
  set hasMore(bool value) {
    _$hasMoreAtom.reportWrite(value, super.hasMore, () {
      super.hasMore = value;
    });
  }

  final _$loadInitialPageAsyncAction =
      AsyncAction('_NetworkGalleryListStoreBase.loadInitialPage');

  @override
  Future<void> loadInitialPage() {
    return _$loadInitialPageAsyncAction.run(() => super.loadInitialPage());
  }

  final _$loadNextPageAsyncAction =
      AsyncAction('_NetworkGalleryListStoreBase.loadNextPage');

  @override
  Future<void> loadNextPage() {
    return _$loadNextPageAsyncAction.run(() => super.loadNextPage());
  }

  final _$refreshPageAsyncAction =
      AsyncAction('_NetworkGalleryListStoreBase.refreshPage');

  @override
  Future<void> refreshPage() {
    return _$refreshPageAsyncAction.run(() => super.refreshPage());
  }

  @override
  String toString() {
    return '''
data: ${data},
currentPage: ${currentPage},
loading: ${loading},
hasMore: ${hasMore}
    ''';
  }
}
