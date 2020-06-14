// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FavoriteStore on _FavoriteStoreBase, Store {
  final _$statusAtom = Atom(name: '_FavoriteStoreBase.status');

  @override
  ObservableMap<GalleryId, FavoriteStatus> get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(ObservableMap<GalleryId, FavoriteStatus> value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  final _$loadFavoriteStatusAsyncAction =
      AsyncAction('_FavoriteStoreBase.loadFavoriteStatus');

  @override
  Future<void> loadFavoriteStatus(GalleryId id) {
    return _$loadFavoriteStatusAsyncAction
        .run(() => super.loadFavoriteStatus(id));
  }

  final _$addToFavoriteAsyncAction =
      AsyncAction('_FavoriteStoreBase.addToFavorite');

  @override
  Future<void> addToFavorite(GalleryId id, FavoriteStatus data) {
    return _$addToFavoriteAsyncAction.run(() => super.addToFavorite(id, data));
  }

  final _$deleteFromFavoritesAsyncAction =
      AsyncAction('_FavoriteStoreBase.deleteFromFavorites');

  @override
  Future<void> deleteFromFavorites(GalleryId id) {
    return _$deleteFromFavoritesAsyncAction
        .run(() => super.deleteFromFavorites(id));
  }

  @override
  String toString() {
    return '''
status: ${status}
    ''';
  }
}
