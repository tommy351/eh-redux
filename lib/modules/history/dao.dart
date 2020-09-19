import 'package:eh_redux/database/database.dart';
import 'package:eh_redux/modules/download/daos/task.dart';
import 'package:eh_redux/modules/gallery/dao.dart';
import 'package:eh_redux/modules/gallery/types.dart';
import 'package:logging/logging.dart';
import 'package:moor/moor.dart';

part 'dao.g.dart';

@UseDao(tables: [Galleries, DownloadTasks])
class HistoryDao extends DatabaseAccessor<Database> with _$HistoryDaoMixin {
  HistoryDao(Database db) : super(db);

  static final _log = Logger('HistoryDao');

  Stream<List<Gallery>> watchAll() {
    _log.fine('watchAll');
    final query = select(galleries)
      ..where((t) => isNotNull(t.lastReadAt))
      ..orderBy([
        (t) => OrderingTerm.desc(t.lastReadAt),
      ]);

    return query.map((e) => Gallery.fromEntry(e)).watch();
  }

  Future<void> deleteAll() async {
    _log.fine('deleteAll');

    final taskIds = await select(downloadTasks).map((t) => t.galleryId).get();
    _log.finer('Download task IDs: $taskIds');

    final query = delete(galleries)..where((t) => t.id.isNotIn(taskIds));

    await query.go();
  }
}
