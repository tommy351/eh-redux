import 'package:built_collection/built_collection.dart';
import 'package:eh_redux/models/gallery.dart';
import 'package:eh_redux/models/pagination.dart';
import 'package:eh_redux/repositories/ehentai_client.dart';
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
  ObservableMap<GalleryId, GalleryDetails> details = ObservableMap.of({});

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
      updateIndex: (index, ids) => index.rebuild((b) => b.replace(ids)),
    );
  }

  @action
  Future<void> loadGalleryDetails(GalleryId id) async {
    if (data[id] == null) {
      addAll(await client.getGalleriesData([id]));
    }

    if (details[id] == null) {
      details[id] = await client.getGalleryDetails(id);
    }
  }

  @action
  void setCurrentFavorite(GalleryId id, int value) {
    if (details[id] != null) {
      details[id] = details[id].rebuild((b) => b..currentFavorite = value);
    }
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
      params['advsearch'] = '1';

      if (key.options.categoryFilter > 0) {
        params['f_cats'] = key.options.categoryFilter.toString();
      }

      if (key.options.minimumRating > 0) {
        params['f_sr'] = 'on';
        params['f_srdd'] = key.options.minimumRating.toString();
      }

      for (final entry in key.options.advancedOptions.entries) {
        if (entry.value) {
          params[entry.key] = 'on';
        }
      }
    }

    final query = params.entries
        .map((e) =>
            '${Uri.encodeQueryComponent(e.key)}=${Uri.encodeQueryComponent(e.value)}')
        .join('&');

    return '$path?$query';
  }
}
