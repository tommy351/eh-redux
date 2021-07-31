// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FavoriteStore on _FavoriteStoreBase, Store {
  final _$namesAtom = Atom(name: '_FavoriteStoreBase.names');

  @override
  ObservableMap<String, String> get names {
    _$namesAtom.reportRead();
    return super.names;
  }

  @override
  set names(ObservableMap<String, String> value) {
    _$namesAtom.reportWrite(value, super.names, () {
      super.names = value;
    });
  }

  final _$indexAtom = Atom(name: '_FavoriteStoreBase.index');

  @override
  String? get index {
    _$indexAtom.reportRead();
    return super.index;
  }

  @override
  set index(String? value) {
    _$indexAtom.reportWrite(value, super.index, () {
      super.index = value;
    });
  }

  final _$loadingAtom = Atom(name: '_FavoriteStoreBase.loading');

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

  final _$loadedAtom = Atom(name: '_FavoriteStoreBase.loaded');

  @override
  bool get loaded {
    _$loadedAtom.reportRead();
    return super.loaded;
  }

  @override
  set loaded(bool value) {
    _$loadedAtom.reportWrite(value, super.loaded, () {
      super.loaded = value;
    });
  }

  final _$submittingAtom = Atom(name: '_FavoriteStoreBase.submitting');

  @override
  bool get submitting {
    _$submittingAtom.reportRead();
    return super.submitting;
  }

  @override
  set submitting(bool value) {
    _$submittingAtom.reportWrite(value, super.submitting, () {
      super.submitting = value;
    });
  }

  final _$canDeleteAtom = Atom(name: '_FavoriteStoreBase.canDelete');

  @override
  bool get canDelete {
    _$canDeleteAtom.reportRead();
    return super.canDelete;
  }

  @override
  set canDelete(bool value) {
    _$canDeleteAtom.reportWrite(value, super.canDelete, () {
      super.canDelete = value;
    });
  }

  final _$loadAsyncAction = AsyncAction('_FavoriteStoreBase.load');

  @override
  Future<void> load() {
    return _$loadAsyncAction.run(() => super.load());
  }

  final _$addToFavoritesAsyncAction =
      AsyncAction('_FavoriteStoreBase.addToFavorites');

  @override
  Future<void> addToFavorites() {
    return _$addToFavoritesAsyncAction.run(() => super.addToFavorites());
  }

  final _$deleteFromFavoritesAsyncAction =
      AsyncAction('_FavoriteStoreBase.deleteFromFavorites');

  @override
  Future<void> deleteFromFavorites() {
    return _$deleteFromFavoritesAsyncAction
        .run(() => super.deleteFromFavorites());
  }

  final _$_FavoriteStoreBaseActionController =
      ActionController(name: '_FavoriteStoreBase');

  @override
  void setIndex(String value) {
    final _$actionInfo = _$_FavoriteStoreBaseActionController.startAction(
        name: '_FavoriteStoreBase.setIndex');
    try {
      return super.setIndex(value);
    } finally {
      _$_FavoriteStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
names: ${names},
index: ${index},
loading: ${loading},
loaded: ${loaded},
submitting: ${submitting},
canDelete: ${canDelete}
    ''';
  }
}
