import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:collection/collection.dart';
import 'package:eh_redux/models/content_warning_exception.dart';
import 'package:eh_redux/models/gallery.dart';
import 'package:eh_redux/models/pagination.dart';
import 'package:eh_redux/models/request_exception.dart';
import 'package:eh_redux/repositories/ehentai_client.dart';
import 'package:eh_redux/tables/gallery.dart';
import 'package:meta/meta.dart';
import 'package:mobx/mobx.dart';

part 'gallery.g.dart';

class _GalleryLoadResult {
  const _GalleryLoadResult({
    @required this.galleries,
    this.noMore = false,
  }) : assert(galleries != null);

  final List<Gallery> galleries;
  final bool noMore;
}

const baseAdvancedSearchOptions = <String, bool>{
  'f_sname': true,
  'f_stags': true,
};

class GalleryStore = _GalleryStoreBase with _$GalleryStore;

abstract class _GalleryStoreBase with Store {
  _GalleryStoreBase({
    @required this.client,
    @required this.galleriesDao,
  }) : assert(client != null);

  static const _mapEquality = MapEquality();
  static const _galleryPerPage = 25;

  final EHentaiClient client;
  final GalleriesDao galleriesDao;

  @observable
  ObservableMap<GalleryId, Gallery> data = ObservableMap.of({});

  @observable
  ObservableMap<GalleryId, GalleryDetails> details = ObservableMap.of({});

  @observable
  ObservableMap<GalleryId, GalleryError> errors = ObservableMap.of({});

  @observable
  ObservableSet<GalleryId> contentWarningDisabled = ObservableSet.of([]);

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
      errors.remove(id);

      try {
        details[id] = await client.getGalleryDetails(
          id,
          disableContentWarning: contentWarningDisabled.contains(id),
        );
      } on ContentWarningException catch (err) {
        errors[id] = GalleryError.contentWarning(reason: err.reason);
      } on RequestException catch (err) {
        errors[id] = GalleryError(message: err.message);
      } catch (err) {
        errors[id] = GalleryError(message: err.toString());
      }
    }
  }

  @action
  void setCurrentFavorite(GalleryId id, int value) {
    if (details[id] != null) {
      details[id] = details[id].copyWith(currentFavorite: value);
    }
  }

  @action
  void disableContentWarning(GalleryId id) {
    contentWarningDisabled.add(id);
  }

  @action
  Future<void> saveGallery(GalleryId id) async {
    final entry = data[id]?.toEntry();

    if (entry != null) {
      await galleriesDao.insertEntry(entry);
    }
  }

  Future<void> _loadPage({
    @required GalleryPaginationKey key,
    @required int page,
    @required
        BuiltSet<GalleryId> Function(
                BuiltSet<GalleryId> currentIndex, Iterable<GalleryId> newIndex)
            updateIndex,
  }) async {
    if (_getPaginationByKey(key).loading) return;

    paginations[key] = _getPaginationByKey(key).copyWith(loading: true);

    try {
      final result = await key.maybeMap<Future<_GalleryLoadResult>>(
        history: (key) => _loadPageFromDatabase(),
        orElse: () => _loadPageFromNetwork(key, page),
      );

      addAll(result.galleries);

      paginations[key] = _getPaginationByKey(key).copyWith(
        index: updateIndex(
            _getPaginationByKey(key).index, result.galleries.map((e) => e.id)),
        currentPage: page,
        noMore: result.noMore,
      );
    } finally {
      paginations[key] = _getPaginationByKey(key).copyWith(loading: false);
    }
  }

  Future<_GalleryLoadResult> _loadPageFromNetwork(
    GalleryPaginationKey key,
    int page,
  ) async {
    final ids = await client.getGalleryIds(_getListPath(key, page));
    final galleries = await client.getGalleriesData(ids);

    return _GalleryLoadResult(
      galleries: galleries,
      noMore: galleries.length < _galleryPerPage,
    );
  }

  Future<_GalleryLoadResult> _loadPageFromDatabase() async {
    final entries = await galleriesDao.listEntries();

    return _GalleryLoadResult(
      galleries: entries.map((e) => Gallery.fromEntry(e)).toList(),
      noMore: true,
    );
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
        };

        if (value.categoryFilter > 0) {
          result['f_cats'] = value.categoryFilter.toString();
        }

        if (_isAdvancedSearchEnabled(value)) {
          result['advsearch'] = '1';
          _addBoolEntriesToStringMap(result, baseAdvancedSearchOptions);
        }

        if (value.advancedOptions != null) {
          _addBoolEntriesToStringMap(result, value.advancedOptions.asMap());
        }

        if (value.minimumRating > 0) {
          result['f_sr'] = 'on';
          result['f_srdd'] = value.minimumRating.toString();
        }

        return result;
      },
      orElse: () => {},
    );

    params['page'] = page.toString();

    final query = params.entries
        .map((e) =>
            '${Uri.encodeQueryComponent(e.key)}=${Uri.encodeQueryComponent(e.value)}')
        .join('&');

    return '$path?$query';
  }

  bool _isAdvancedSearchEnabled(GalleryPaginationKeySearch key) {
    if (key.minimumRating > 0) return true;

    final enabldAdvancedOptions =
        Map.fromEntries(key.advancedOptions.entries.where((e) => e.value));

    if (key.advancedOptions != null &&
        !_mapEquality.equals(
            enabldAdvancedOptions, baseAdvancedSearchOptions)) {
      return true;
    }

    return false;
  }

  void _addBoolEntriesToStringMap(
      Map<String, String> target, Map<String, bool> source) {
    for (final entry in source.entries) {
      if (entry.value) {
        target[entry.key] = 'on';
      } else {
        target.remove(entry.key);
      }
    }
  }
}
