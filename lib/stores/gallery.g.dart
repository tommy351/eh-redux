// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gallery.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GalleryStore on _GalleryStoreBase, Store {
  final _$dataAtom = Atom(name: '_GalleryStoreBase.data');

  @override
  ObservableMap<GalleryId, Gallery> get data {
    _$dataAtom.reportRead();
    return super.data;
  }

  @override
  set data(ObservableMap<GalleryId, Gallery> value) {
    _$dataAtom.reportWrite(value, super.data, () {
      super.data = value;
    });
  }

  final _$paginationsAtom = Atom(name: '_GalleryStoreBase.paginations');

  @override
  ObservableMap<GalleryPaginationKey, Pagination<GalleryId>> get paginations {
    _$paginationsAtom.reportRead();
    return super.paginations;
  }

  @override
  set paginations(
      ObservableMap<GalleryPaginationKey, Pagination<GalleryId>> value) {
    _$paginationsAtom.reportWrite(value, super.paginations, () {
      super.paginations = value;
    });
  }

  final _$loadInitialPageAsyncAction =
      AsyncAction('_GalleryStoreBase.loadInitialPage');

  @override
  Future<void> loadInitialPage(GalleryPaginationKey key) {
    return _$loadInitialPageAsyncAction.run(() => super.loadInitialPage(key));
  }

  final _$loadNextPageAsyncAction =
      AsyncAction('_GalleryStoreBase.loadNextPage');

  @override
  Future<void> loadNextPage(GalleryPaginationKey key) {
    return _$loadNextPageAsyncAction.run(() => super.loadNextPage(key));
  }

  final _$refreshPageAsyncAction = AsyncAction('_GalleryStoreBase.refreshPage');

  @override
  Future<void> refreshPage(GalleryPaginationKey key) {
    return _$refreshPageAsyncAction.run(() => super.refreshPage(key));
  }

  final _$_GalleryStoreBaseActionController =
      ActionController(name: '_GalleryStoreBase');

  @override
  void add(Gallery gallery) {
    final _$actionInfo = _$_GalleryStoreBaseActionController.startAction(
        name: '_GalleryStoreBase.add');
    try {
      return super.add(gallery);
    } finally {
      _$_GalleryStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addAll(Iterable<Gallery> gallery) {
    final _$actionInfo = _$_GalleryStoreBaseActionController.startAction(
        name: '_GalleryStoreBase.addAll');
    try {
      return super.addAll(gallery);
    } finally {
      _$_GalleryStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
data: ${data},
paginations: ${paginations}
    ''';
  }
}
