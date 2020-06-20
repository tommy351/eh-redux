import 'package:built_collection/built_collection.dart';
import 'package:eh_redux/models/gallery.dart';
import 'package:eh_redux/models/pagination.dart';
import 'package:eh_redux/repositories/ehentai_client.dart';
import 'package:meta/meta.dart';
import 'package:mobx/mobx.dart';

part 'gallery.g.dart';

class GalleryStore = _GalleryStoreBase with _$GalleryStore;

abstract class _GalleryStoreBase with Store {
  _GalleryStoreBase({
    @required this.client,
  }) : assert(client != null);

  static const _galleryPerPage = 25;

  final EHentaiClient client;

  @observable
  ObservableMap<GalleryId, Gallery> data = ObservableMap.of({});

  @observable
  ObservableMap<GalleryId, GalleryDetails> details = ObservableMap.of({});

  @observable
  ObservableMap<GalleryPaginationKey, Pagination<GalleryId>> paginations =
      ObservableMap.of({});

  Pagination<GalleryId> _getPaginationByKey(GalleryPaginationKey key) {
    return paginations[key] ??
        Pagination<GalleryId>(index: newEmptyPaginationIndex());
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
      details[id] = details[id].copyWith(currentFavorite: value);
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

    paginations[key] = _getPaginationByKey(key).copyWith(loading: true);

    try {
      final ids = await client.getGalleryIds(_getListPath(key, page));
      final galleries = await client.getGalleriesData(ids);

      addAll(galleries);

      paginations[key] = _getPaginationByKey(key).copyWith(
        index: updateIndex(_getPaginationByKey(key).index, ids),
        currentPage: page,
        noMore: galleries.length < _galleryPerPage,
      );
    } finally {
      paginations[key] = _getPaginationByKey(key).copyWith(loading: false);
    }
  }

  String _getListPath(GalleryPaginationKey key, int page) {
    final path = key.maybeMap<String>(
      favorite: (_) => '/favorites.php',
      orElse: () => '/',
    );
    final params = key.maybeMap<Map<String, String>>(
      search: (value) {
        final result = <String, String>{
          'f_search': value.query,
          'advsearch': '1',
        };

        if (value.categoryFilter > 0) {
          result['f_cats'] = value.categoryFilter.toString();
        }

        for (final entry in value.advancedOptions.entries) {
          if (entry.value) {
            result[entry.key] = 'on';
          }
        }

        if (value.minimumRating > 0) {
          result['f_sr'] = 'on';
          result['f_srdd'] = value.minimumRating.toString();
        }

        return result;
      },
      orElse: () => {},
    );

    final query = params.entries
        .map((e) =>
            '${Uri.encodeQueryComponent(e.key)}=${Uri.encodeQueryComponent(e.value)}')
        .join('&');

    return '$path?$query';
  }
}
