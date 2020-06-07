import 'package:built_collection/built_collection.dart';
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
      await loadNextPage(key);
    }
  }

  @action
  Future<void> loadNextPage(GalleryPaginationKey key) async {
    final pagination = _getPaginationByKey(key);

    await _loadPage(
      key: key,
      page: pagination.currentPage + 1,
      updateIndex: (index, ids) => index.rebuild((b) => b.addAll(ids)),
    );
  }

  @action
  Future<void> refreshPage(GalleryPaginationKey key) async {
    await _loadPage(
      key: key,
      page: 0,
      updateIndex: (index, ids) => BuiltSet.from(ids),
    );
  }

  Future<void> _loadPage({
    @required GalleryPaginationKey key,
    @required int page,
    @required
        BuiltSet<GalleryId> Function(
                BuiltSet<GalleryId> currentIndex, List<GalleryId> newIndex)
            updateIndex,
  }) async {
    if (_getPaginationByKey(key).loading) return;

    paginations[key] =
        _getPaginationByKey(key).rebuild((b) => b.loading = true);

    try {
      final ids = await client.getGalleryIds(_getListPath(key, page));
      final galleries = await client.getGalleriesData(ids);

      addAll(galleries);

      paginations[key] = _getPaginationByKey(key).rebuild((b) => b
        ..index = updateIndex(b.index, ids)
        ..currentPage = page
        ..noMore = galleries.length < _galleryPerPage);
    } finally {
      paginations[key] =
          _getPaginationByKey(key).rebuild((b) => b..loading = false);
    }
  }

  String _getListPath(GalleryPaginationKey key, int page) {
    String path = '/';
    final params = <String, String>{'page': '$page'};

    if (key is GalleryPaginationKeyFavorite) {
      path = '/favorites.php';
    } else if (key is GalleryPaginationKeySearch) {
      params['f_search'] = key.options.query;
    }

    final query = params.entries
        .map((e) =>
            '${Uri.encodeQueryComponent(e.key)}=${Uri.encodeQueryComponent(e.value)}')
        .join('&');

    return '$path?$query';
  }
}
