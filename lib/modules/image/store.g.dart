// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ImageStore on _ImageStoreBase, Store {
  Computed<int> _$currentPage1Computed;

  @override
  int get currentPage1 =>
      (_$currentPage1Computed ??= Computed<int>(() => super.currentPage1,
              name: '_ImageStoreBase.currentPage1'))
          .value;
  Computed<GalleryImage> _$currentImageComputed;

  @override
  GalleryImage get currentImage => (_$currentImageComputed ??=
          Computed<GalleryImage>(() => super.currentImage,
              name: '_ImageStoreBase.currentImage'))
      .value;

  final _$currentPageAtom = Atom(name: '_ImageStoreBase.currentPage');

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

  final _$readPositionLoadedAtom =
      Atom(name: '_ImageStoreBase.readPositionLoaded');

  @override
  bool get readPositionLoaded {
    _$readPositionLoadedAtom.reportRead();
    return super.readPositionLoaded;
  }

  @override
  set readPositionLoaded(bool value) {
    _$readPositionLoadedAtom.reportWrite(value, super.readPositionLoaded, () {
      super.readPositionLoaded = value;
    });
  }

  final _$dataAtom = Atom(name: '_ImageStoreBase.data');

  @override
  ObservableMap<int, GalleryImage> get data {
    _$dataAtom.reportRead();
    return super.data;
  }

  @override
  set data(ObservableMap<int, GalleryImage> value) {
    _$dataAtom.reportWrite(value, super.data, () {
      super.data = value;
    });
  }

  final _$loadingAtom = Atom(name: '_ImageStoreBase.loading');

  @override
  ObservableSet<int> get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(ObservableSet<int> value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$errorAtom = Atom(name: '_ImageStoreBase.error');

  @override
  ObservableMap<int, ImageError> get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(ObservableMap<int, ImageError> value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  final _$navVisibleAtom = Atom(name: '_ImageStoreBase.navVisible');

  @override
  bool get navVisible {
    _$navVisibleAtom.reportRead();
    return super.navVisible;
  }

  @override
  set navVisible(bool value) {
    _$navVisibleAtom.reportWrite(value, super.navVisible, () {
      super.navVisible = value;
    });
  }

  final _$loadReadPositionAsyncAction =
      AsyncAction('_ImageStoreBase.loadReadPosition');

  @override
  Future<void> loadReadPosition() {
    return _$loadReadPositionAsyncAction.run(() => super.loadReadPosition());
  }

  final _$loadPageAsyncAction = AsyncAction('_ImageStoreBase.loadPage');

  @override
  Future<void> loadPage(int page,
      {String reloadKey, bool networkOnly = false}) {
    return _$loadPageAsyncAction.run(() =>
        super.loadPage(page, reloadKey: reloadKey, networkOnly: networkOnly));
  }

  final _$_ImageStoreBaseActionController =
      ActionController(name: '_ImageStoreBase');

  @override
  void toggleNav() {
    final _$actionInfo = _$_ImageStoreBaseActionController.startAction(
        name: '_ImageStoreBase.toggleNav');
    try {
      return super.toggleNav();
    } finally {
      _$_ImageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCurrentPage(int page) {
    final _$actionInfo = _$_ImageStoreBaseActionController.startAction(
        name: '_ImageStoreBase.setCurrentPage');
    try {
      return super.setCurrentPage(page);
    } finally {
      _$_ImageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentPage: ${currentPage},
readPositionLoaded: ${readPositionLoaded},
data: ${data},
loading: ${loading},
error: ${error},
navVisible: ${navVisible},
currentPage1: ${currentPage1},
currentImage: ${currentImage}
    ''';
  }
}
