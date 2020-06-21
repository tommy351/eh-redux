import 'dart:developer' as developer;

import 'package:moor/moor.dart';

import 'database.dart';

part 'search_history.g.dart';

@DataClassName('SearchHistoryEntry')
class SearchHistories extends Table {
  TextColumn get query => text()();
  DateTimeColumn get lastQueriedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {query};
}

@UseDao(tables: [SearchHistories])
class SearchHistoriesDao extends DatabaseAccessor<Database>
    with _$SearchHistoriesDaoMixin {
  SearchHistoriesDao(Database db) : super(db);

  Future<void> insertEntry(SearchHistoryEntry entry) async {
    developer.log('Insert search history: $entry');
    await into(searchHistories).insertOnConflictUpdate(entry);
  }

  Future<List<SearchHistoryEntry>> listEntries(String pattern) async {
    developer.log('List search history: $pattern');
    final query = select(searchHistories)
      ..where((t) => t.query.like('%$pattern%'))
      ..orderBy([
        (e) =>
            OrderingTerm(expression: e.lastQueriedAt, mode: OrderingMode.desc),
      ]);

    return query.get();
  }

  Future<void> deleteAllEntries() async {
    developer.log('Clear search history');
    await delete(searchHistories).go();
  }
}
