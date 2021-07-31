import 'package:collection/collection.dart';
import 'package:eh_redux/database/database.dart';
import 'package:eh_redux/modules/search/dao.dart';
import 'package:mobx/mobx.dart';

part 'store.g.dart';

class SearchStore = _SearchStoreBase with _$SearchStore;

abstract class _SearchStoreBase with Store {
  _SearchStoreBase({
    required this.searchHistoriesDao,
  });

  final SearchHistoriesDao searchHistoriesDao;

  static const _mapEquality = MapEquality();
  static const _baseAdvancedOptions = <String, bool>{
    'f_sname': true,
    'f_stags': true,
  };

  @observable
  String query = '';

  @observable
  int categoryFilter = 0;

  @observable
  ObservableMap<String, bool> advancedOptions =
      ObservableMap.of(_baseAdvancedOptions);

  @observable
  int minimumRating = 0;

  @observable
  ObservableMap<String, String> params = ObservableMap();

  @action
  void updateParams() {
    final newParams = <String, String>{};
    newParams['f_search'] = query;

    if (_isAdvancedSearchEnabled()) {
      newParams['advsearch'] = '1';
      _addBoolEntriesToStringMap(newParams, _baseAdvancedOptions);
    }

    _addBoolEntriesToStringMap(newParams, advancedOptions);

    if (categoryFilter > 0) {
      newParams['f_cats'] = categoryFilter.toString();
    }

    if (minimumRating > 0) {
      newParams['f_sr'] = 'on';
      newParams['f_srdd'] = minimumRating.toString();
    }

    if (!_mapEquality.equals(params, newParams)) {
      params
        ..clear()
        ..addAll(newParams);
    }
  }

  @action
  void setQuery(String value) {
    query = value;
    updateParams();

    if (value.isNotEmpty) {
      searchHistoriesDao.insertEntry(SearchHistoryEntry(
        query: value,
        lastQueriedAt: DateTime.now(),
      ));
    }
  }

  // ignore: use_setters_to_change_properties
  @action
  void setCategoryFilter(int value) {
    categoryFilter = value;
  }

  @action
  void setAdvancedOption({
    required String key,
    required bool value,
  }) {
    advancedOptions[key] = value;
  }

  // ignore: use_setters_to_change_properties
  @action
  void setMinimumRating(int value) {
    minimumRating = value;
  }

  bool _isAdvancedSearchEnabled() {
    if (minimumRating > 0) return true;

    final enabldAdvancedOptions =
        Map.fromEntries(advancedOptions.entries.where((e) => e.value));

    if (!_mapEquality.equals(enabldAdvancedOptions, _baseAdvancedOptions)) {
      return true;
    }

    return false;
  }

  void _addBoolEntriesToStringMap(
    Map<String, String> target,
    Map<String, bool> source,
  ) {
    for (final entry in source.entries) {
      if (entry.value) {
        target[entry.key] = 'on';
      } else {
        target.remove(entry.key);
      }
    }
  }
}
