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

  final _$navVisibleAtom = Atom(name: '_ViewStoreBase.navVisible');

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

  final _$loadOptionsAtom = Atom(name: '_ViewStoreBase.loadOptions');

  @override
  ObservableMap<GalleryIdWithPage, ImageLoadOptions> get loadOptions {
    _$loadOptionsAtom.reportRead();
    return super.loadOptions;
  }

  @override
  set loadOptions(ObservableMap<GalleryIdWithPage, ImageLoadOptions> value) {
    _$loadOptionsAtom.reportWrite(value, super.loadOptions, () {
      super.loadOptions = value;
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
  void toggleNav() {
    final _$actionInfo = _$_ViewStoreBaseActionController.startAction(
        name: '_ViewStoreBase.toggleNav');
    try {
      return super.toggleNav();
    } finally {
      _$_ViewStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateLoadOption(ImageLoadOptions options) {
    final _$actionInfo = _$_ViewStoreBaseActionController.startAction(
        name: '_ViewStoreBase.updateLoadOption');
    try {
      return super.updateLoadOption(options);
    } finally {
      _$_ViewStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentPage: ${currentPage},
navVisible: ${navVisible},
loadOptions: ${loadOptions}
    ''';
  }
}
