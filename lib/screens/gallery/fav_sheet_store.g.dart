// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fav_sheet_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FavSheetStore on _FavSheetStoreBase, Store {
  final _$favoriteAtom = Atom(name: '_FavSheetStoreBase.favorite');

  @override
  int get favorite {
    _$favoriteAtom.reportRead();
    return super.favorite;
  }

  @override
  set favorite(int value) {
    _$favoriteAtom.reportWrite(value, super.favorite, () {
      super.favorite = value;
    });
  }

  final _$noteAtom = Atom(name: '_FavSheetStoreBase.note');

  @override
  String get note {
    _$noteAtom.reportRead();
    return super.note;
  }

  @override
  set note(String value) {
    _$noteAtom.reportWrite(value, super.note, () {
      super.note = value;
    });
  }

  final _$initializedAtom = Atom(name: '_FavSheetStoreBase.initialized');

  @override
  bool get initialized {
    _$initializedAtom.reportRead();
    return super.initialized;
  }

  @override
  set initialized(bool value) {
    _$initializedAtom.reportWrite(value, super.initialized, () {
      super.initialized = value;
    });
  }

  final _$futureAtom = Atom(name: '_FavSheetStoreBase.future');

  @override
  ObservableFuture<void> get future {
    _$futureAtom.reportRead();
    return super.future;
  }

  @override
  set future(ObservableFuture<void> value) {
    _$futureAtom.reportWrite(value, super.future, () {
      super.future = value;
    });
  }

  final _$initializeAsyncAction = AsyncAction('_FavSheetStoreBase.initialize');

  @override
  Future<void> initialize() {
    return _$initializeAsyncAction.run(() => super.initialize());
  }

  final _$_FavSheetStoreBaseActionController =
      ActionController(name: '_FavSheetStoreBase');

  @override
  void setFavorite(int value) {
    final _$actionInfo = _$_FavSheetStoreBaseActionController.startAction(
        name: '_FavSheetStoreBase.setFavorite');
    try {
      return super.setFavorite(value);
    } finally {
      _$_FavSheetStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<void> addToFavorite() {
    final _$actionInfo = _$_FavSheetStoreBaseActionController.startAction(
        name: '_FavSheetStoreBase.addToFavorite');
    try {
      return super.addToFavorite();
    } finally {
      _$_FavSheetStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<void> deleteFromFavorite() {
    final _$actionInfo = _$_FavSheetStoreBaseActionController.startAction(
        name: '_FavSheetStoreBase.deleteFromFavorite');
    try {
      return super.deleteFromFavorite();
    } finally {
      _$_FavSheetStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
favorite: ${favorite},
note: ${note},
initialized: ${initialized},
future: ${future}
    ''';
  }
}
