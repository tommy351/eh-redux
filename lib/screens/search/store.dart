import 'package:built_collection/built_collection.dart';
import 'package:eh_redux/models/gallery.dart';
import 'package:eh_redux/stores/gallery.dart';
import 'package:eh_redux/tables/database.dart';
import 'package:eh_redux/tables/search_history.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:mobx/mobx.dart';

part 'store.g.dart';

class SearchStore = _SearchStoreBase with _$SearchStore;

abstract class _SearchStoreBase with Store {
  _SearchStoreBase({
    @required this.galleryStore,
    @required this.searchHistoriesDao,
  }) : assert(galleryStore != null);

  final GalleryStore galleryStore;
  final SearchHistoriesDao searchHistoriesDao;

  @observable
  String query = '';

  @observable
  GalleryPaginationKeySearch paginationKey;

  @observable
  int categoryFilter = 0;

  @observable
  ObservableMap<String, bool> advancedOptions =
      ObservableMap.of(baseAdvancedSearchOptions);

  @observable
  int minimumRating = 0;

  // ignore: use_setters_to_change_properties
  @action
  void setQuery(String value) {
    query = value;
  }

  // ignore: use_setters_to_change_properties
  @action
  void setCategoryFilter(int value) {
    categoryFilter = value;
  }

  @action
  void setAdvancedOption({
    @required String key,
    @required bool value,
  }) {
    advancedOptions[key] = value;
  }

  // ignore: use_setters_to_change_properties
  @action
  void setMinimumRating(int value) {
    minimumRating = value;
  }

  @action
  Future<void> updatePaginationKey() async {
    if (query.isEmpty) return;

    paginationKey = GalleryPaginationKeySearch(
      query: query,
      categoryFilter: categoryFilter,
      advancedOptions: BuiltMap<String, bool>(advancedOptions),
      minimumRating: minimumRating,
    );

    await searchHistoriesDao.insertEntry(SearchHistoryEntry(
      query: query,
      lastQueriedAt: DateTime.now(),
    ));
  }
}
