import 'dart:async';
import 'dart:developer' as developer;

import 'package:eh_redux/models/download.dart';
import 'package:moor/moor.dart';

import 'database.dart';

part 'download_task.g.dart';

@DataClassName('DownloadTaskEntry')
class DownloadTasks extends Table {
  IntColumn get galleryId => integer()();
  TextColumn get state => text()();
  IntColumn get current => integer()();
  IntColumn get total => integer()();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column> get primaryKey => {galleryId};
}

@UseDao(tables: [DownloadTasks])
class DownloadTasksDao extends DatabaseAccessor<Database>
    with _$DownloadTasksDaoMixin {
  DownloadTasksDao(Database db) : super(db);

  Future<void> insertIfNotExist(DownloadTaskEntry entry) async {
    developer.log('Insert download task: $entry');
    await into(downloadTasks).insert(
      entry,
      onConflict: DoUpdate(
        (_) => DownloadTasksCompanion(
          galleryId: Value(entry.galleryId),
        ),
      ),
    );
  }

  Future<void> updateStatus(
    int galleryId,
    DownloadTaskState state, {
    int current,
  }) async {
    developer.log(
        'Update download task status (id=$galleryId, state=$state, current=$current)');
    final query = update(downloadTasks)
      ..where((t) => t.galleryId.equals(galleryId));

    await query.write(DownloadTasksCompanion(
      state: Value(state.toString()),
      current: current == null ? const Value.absent() : Value(current),
    ));
  }

  Future<DownloadTaskEntry> getEntry(int galleryId) async {
    developer.log('Get download task (id=$galleryId)');
    final query = select(downloadTasks)
      ..where((t) => t.galleryId.equals(galleryId));
    return query.getSingle();
  }

  Future<List<DownloadTaskEntry>> listEntries() async {
    developer.log('List download tasks');
    final query = select(downloadTasks)
      ..orderBy([
        (e) => OrderingTerm(expression: e.createdAt, mode: OrderingMode.desc),
      ]);

    return query.get();
  }

  Stream<DownloadTaskEntry> watchEntry(int galleryId) {
    developer.log('Watch download task (id=$galleryId)');
    final query = select(downloadTasks)
      ..where((t) => t.galleryId.equals(galleryId));
    return query.watchSingle();
  }

  Stream<List<DownloadTaskEntry>> watchEntries() {
    developer.log('Watch download tasks');
    final query = select(downloadTasks);
    return query.watch();
  }
}
