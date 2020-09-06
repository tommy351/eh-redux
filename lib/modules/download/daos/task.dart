import 'package:eh_redux/database/converter.dart';
import 'package:eh_redux/database/database.dart';
import 'package:eh_redux/modules/download/types.dart';
import 'package:eh_redux/modules/gallery/dao.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:logging/logging.dart';
import 'package:moor/moor.dart';

part 'task.g.dart';

@DataClassName('DownloadTaskEntry')
class DownloadTasks extends Table {
  IntColumn get galleryId => integer()();
  IntColumn get totalCount => integer()();
  IntColumn get downloadedCount => integer()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get queuedAt => dateTime()();
  TextColumn get state =>
      text().map(const EnumStringConverter(DownloadTaskState.values))();
  TextColumn get errorDetails => text().nullable()();

  @override
  Set<Column> get primaryKey => {galleryId};
}

@UseDao(tables: [DownloadTasks, Galleries])
class DownloadTasksDao extends DatabaseAccessor<Database>
    with _$DownloadTasksDaoMixin {
  DownloadTasksDao(Database db) : super(db);

  static final _log = Logger('DownloadTasksDao');

  Stream<List<DownloadTaskWithGallery>> watchAllWithGallery() {
    _log.finer('Watch download tasks');
    final query = select(downloadTasks).join([
      leftOuterJoin(galleries, galleries.id.equalsExp(downloadTasks.galleryId)),
    ]);

    return query.watch().map((rows) {
      return rows.map((row) {
        return DownloadTaskWithGallery.fromEntry(
          task: row.readTable(downloadTasks),
          gallery: row.readTable(galleries),
        );
      }).toList();
    });
  }

  Stream<DownloadTask> watchSingle(int galleryId) {
    _log.finer('Watch download task: galleryId=$galleryId');
    final query = select(downloadTasks)
      ..where((t) => t.galleryId.equals(galleryId));

    return query.map((e) => DownloadTask.fromEntry(e)).watchSingle();
  }

  Future<DownloadTask> getSingle(int galleryId) {
    _log.finer('Get download task: $galleryId');
    final query = select(downloadTasks)
      ..where((t) => t.galleryId.equals(galleryId));

    return query.map((e) => DownloadTask.fromEntry(e)).getSingle();
  }

  Future<void> insertSingle(DownloadTask entry) async {
    _log.finer('Insert download task: $entry');
    await into(downloadTasks).insert(entry.toEntry());
  }

  Future<void> deleteByGalleryId(int galleryId) async {
    _log.finer('Delete download task: galleryId=$galleryId');
    final query = delete(downloadTasks)
      ..where((t) => t.galleryId.equals(galleryId));

    await query.go();
  }

  Future<void> updateSingleStatus(
    int galleryId, {
    @required DownloadTaskState state,
    int downloadedCount,
    DateTime queuedAt,
    String errorDetails,
  }) async {
    _log.finer(
        'Update download task status: galleryId=$galleryId, state=$state, downloadedCount=$downloadedCount, queuedAt=$queuedAt, errorDetails=$errorDetails');
    final query = update(downloadTasks)
      ..where((t) => t.galleryId.equals(galleryId));

    await query.write(DownloadTasksCompanion(
      state: Value(state),
      downloadedCount: downloadedCount != null
          ? Value(downloadedCount)
          : const Value.absent(),
      queuedAt: queuedAt != null ? Value(queuedAt) : const Value.absent(),
      errorDetails:
          errorDetails != null ? Value(errorDetails) : const Value.absent(),
    ));
  }

  Future<void> updateAllStatus({
    @required DownloadTaskState state,
    Iterable<DownloadTaskState> stateIsIn,
    DateTime queuedAt,
  }) async {
    _log.finer(
        'Update all download tasks status: state=$state, stateIsIn=$stateIsIn, queuedAt=$queuedAt');
    final query = update(downloadTasks);

    if (stateIsIn != null) {
      query.where(
          (t) => t.state.isIn(stateIsIn.map((e) => EnumToString.parse(e))));
    }

    await query.write(DownloadTasksCompanion(
      state: Value(state),
      queuedAt: queuedAt != null ? Value(queuedAt) : const Value.absent(),
    ));
  }

  Future<DownloadTask> nextPendingTask() async {
    _log.finer('Get next pending download task');
    final query = select(downloadTasks)
      ..where(
          (t) => t.state.equals(EnumToString.parse(DownloadTaskState.pending)))
      ..orderBy([
        (t) => OrderingTerm.asc(t.queuedAt),
        (t) => OrderingTerm.asc(t.createdAt),
      ]);

    return query.map((e) => DownloadTask.fromEntry(e)).getSingle();
  }
}
