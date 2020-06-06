import 'package:ehreader/models/gallery.dart';
import 'package:ehreader/models/pagination.dart';
import 'package:ehreader/repositories/ehentai_client.dart';
import 'package:meta/meta.dart';
import 'package:mobx/mobx.dart';

part 'gallery.g.dart';

class GalleryStore = _GalleryStoreBase with _$GalleryStore;

abstract class _GalleryStoreBase with Store {
  static const _galleryPerPage = 25;

  final EHentaiClient client;

  _GalleryStoreBase({
    @required this.client,
  }) : assert(client != null);

  @observable
  ObservableMap<GalleryId, Gallery> data = ObservableMap.of({});

  @observable
  ObservableMap<GalleryPaginationKey, Pagination<GalleryId>> paginations =
      ObservableMap.of({});

  Pagination<GalleryId> _getPaginationByKey(GalleryPaginationKey key) {
    return paginations[key] ?? Pagination<GalleryId>();
  }

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
    if (_getPaginationByKey(key).loading) return;

    paginations[key] =
        _getPaginationByKey(key).rebuild((b) => b.loading = true);

    try {
      final pagination = _getPaginationByKey(key);
      final nextPage = pagination.currentPage + 1;
      final ids =
          await client.getGalleryIds(path: _getListPath(key), page: nextPage);
      final galleries = await client.getGalleriesData(ids);

      addAll(galleries);

      paginations[key] = _getPaginationByKey(key).rebuild((b) => b
        ..index = pagination.index.rebuild((b) => b.addAll(ids))
        ..currentPage = nextPage
        ..noMore = galleries.length < _galleryPerPage);
    } finally {
      paginations[key] =
          _getPaginationByKey(key).rebuild((b) => b..loading = false);
    }
  }

  String _getListPath(GalleryPaginationKey key) {
    if (key is GalleryPaginationKeyFavorite) {
      return '/favorites.php';
    }

    return '';
  }
}
