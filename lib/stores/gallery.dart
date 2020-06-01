import 'package:ehreader/models/gallery.dart';
import 'package:ehreader/models/pagination.dart';
import 'package:ehreader/repositories/ehentai_client.dart';
import 'package:meta/meta.dart';
import 'package:mobx/mobx.dart';

part 'gallery.g.dart';

class GalleryStore = _GalleryStoreBase with _$GalleryStore;

abstract class _GalleryStoreBase with Store {
  final EHentaiClient client;

  _GalleryStoreBase({
    @required this.client,
  }) : assert(client != null);

  @observable
  ObservableMap<GalleryId, Gallery> data = ObservableMap.of({});

  @observable
  ObservableMap<GalleryPaginationKey, Pagination<GalleryId>> paginations =
      ObservableMap.of({});

  @action
  void add(Gallery gallery) {
    data[gallery.id] = gallery;
  }

  @action
  void addAll(Iterable<Gallery> gallery) {
    data.addEntries(gallery.map((e) => MapEntry(e.id, e)));
  }

  @action
  Future<void> loadInitialPage(GalleryPaginationKey key) async {
    final pagination = paginations[key];

    if (pagination == null || pagination.currentPage < 0) {
      return loadNextPage(key);
    }
  }

  @action
  Future<void> loadNextPage(GalleryPaginationKey key) async {
    final pagination = paginations[key] ?? Pagination<GalleryId>();
    if (pagination.loading) return;

    paginations[key] = pagination.rebuild((b) => b.loading = true);

    final nextPage = pagination.currentPage + 1;
    final ids = await client.getGalleryIds(nextPage);
    final galleries = await client.getGalleriesData(ids);

    addAll(galleries);

    paginations[key] = pagination.rebuild((b) => b
      ..loading = false
      ..index = pagination.index.rebuild((b) => b.addAll(ids))
      ..currentPage = nextPage);
  }
}
