import 'package:eh_redux/models/favorite.dart';
import 'package:eh_redux/models/gallery.dart';
import 'package:eh_redux/repositories/ehentai_client.dart';
import 'package:meta/meta.dart';
import 'package:mobx/mobx.dart';

part 'favorite.g.dart';

class FavoriteStore = _FavoriteStoreBase with _$FavoriteStore;

abstract class _FavoriteStoreBase with Store {
  final EHentaiClient client;

  _FavoriteStoreBase({
    @required this.client,
  }) : assert(client != null);

  @observable
  ObservableMap<GalleryId, FavoriteStatus> status = ObservableMap.of({});

  @action
  Future<void> loadFavoriteStatus(GalleryId id) async {
    if (status[id] != null) return;

    status[id] = await client.getFavoriteStatus(id);
  }
}
