import 'package:eh_redux/database/database.dart';
import 'package:logging/logging.dart';
import 'package:moor/moor.dart';

part 'dao.g.dart';

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

  static final _log = Logger('SearchHistoriesDao');

  Future<void> insertEntry(SearchHistoryEntry entry) async {
    _log.fine('insertEntry: $entry');
    await into(searchHistories).insertOnConflictUpdate(entry);
  }

  Future<List<SearchHistoryEntry>> listEntries(String pattern) async {
    _log.fine('listEntries: $pattern');
    final query = select(searchHistories)
      ..where((t) => t.query.like('%$pattern%'))
      ..orderBy([
        (e) =>
            OrderingTerm(expression: e.lastQueriedAt, mode: OrderingMode.desc),
      ]);

    return query.get();
  }

  Future<void> deleteAllEntries() async {
    _log.fine('deleteAllEntries');
    await delete(searchHistories).go();
  }
}
