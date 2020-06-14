import 'package:eh_redux/models/favorite.dart';
import 'package:eh_redux/models/gallery.dart';
import 'package:eh_redux/repositories/ehentai_client.dart';
import 'package:eh_redux/stores/gallery.dart';
import 'package:meta/meta.dart';
import 'package:mobx/mobx.dart';

part 'favorite.g.dart';

class FavoriteStore = _FavoriteStoreBase with _$FavoriteStore;

abstract class _FavoriteStoreBase with Store {
  final EHentaiClient client;
  final GalleryStore galleryStore;

  _FavoriteStoreBase({
    @required this.client,
    @required this.galleryStore,
  })  : assert(client != null),
        assert(galleryStore != null);

  @observable
  ObservableMap<GalleryId, FavoriteStatus> status = ObservableMap.of({});

  @action
  Future<void> loadFavoriteStatus(GalleryId id) async {
    if (status[id] != null) return;

    status[id] = await client.getFavoriteStatus(id);
  }

  @action
  Future<void> addToFavorite(GalleryId id, FavoriteStatus data) async {
    await client.addToFavorite(id, data);
    status[id] = data;
    galleryStore.setCurrentFavorite(id, data.favorite);
  }

  @action
  Future<void> deleteFromFavorites(GalleryId id) async {
    await client.deleteFromFavorite(id);
    status.remove(id);
    galleryStore.setCurrentFavorite(id, -1);
  }
}
