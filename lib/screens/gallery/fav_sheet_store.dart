import 'package:eh_redux/models/favorite.dart';
import 'package:eh_redux/models/gallery.dart';
import 'package:eh_redux/stores/favorite.dart';
import 'package:meta/meta.dart';
import 'package:mobx/mobx.dart';

part 'fav_sheet_store.g.dart';

class FavSheetStore = _FavSheetStoreBase with _$FavSheetStore;

abstract class _FavSheetStoreBase with Store {
  final FavoriteStore favoriteStore;
  final GalleryId galleryId;

  _FavSheetStoreBase({
    @required this.favoriteStore,
    @required this.galleryId,
  })  : assert(favoriteStore != null),
        assert(galleryId != null);

  @observable
  int favorite = 0;

  @observable
  String note = '';

  @observable
  bool initialized = false;

  @observable
  ObservableFuture<void> future;

  // ignore: use_setters_to_change_properties
  @action
  void setFavorite(int value) {
    favorite = value;
  }

  @action
  Future<void> initialize() async {
    if (initialized) return;

    await favoriteStore.loadFavoriteStatus(galleryId);

    final status = favoriteStore.status[galleryId];

    if (status != null) {
      favorite = status.favorite;
      note = status.note;
    }

    initialized = true;
  }

  @action
  Future<void> addToFavorite() {
    return future = ObservableFuture(favoriteStore.addToFavorite(
      galleryId,
      FavoriteStatus((b) => b
        ..favorite = favorite
        ..note = note),
    ));
  }

  @action
  Future<void> deleteFromFavorite() {
    return future =
        ObservableFuture(favoriteStore.deleteFromFavorites(galleryId));
  }
}
