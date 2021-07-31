import 'package:eh_redux/database/database.dart';
import 'package:logging/logging.dart';
import 'package:moor/moor.dart';

part 'image.g.dart';

@DataClassName('DownloadedImageEntry')
class DownloadedImages extends Table {
  IntColumn get galleryId => integer()();
  IntColumn get page => integer()();
  TextColumn get key => text()();
  IntColumn get width => integer()();
  IntColumn get height => integer()();
  IntColumn get size => integer()();
  TextColumn get path => text()();
  DateTimeColumn get downloadedAt =>
      dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {galleryId, page};
}

@UseDao(tables: [DownloadedImages])
class DownloadedImagesDao extends DatabaseAccessor<Database>
    with _$DownloadedImagesDaoMixin {
  DownloadedImagesDao(Database db) : super(db);

  static final _log = Logger('DownloadedImagesDao');

  Future<DownloadedImageEntry?> getEntry(int galleryId, int page) async {
    _log.fine('getEntry: galleryId=$galleryId, page=$page');
    final query = select(downloadedImages)
      ..where((t) => t.galleryId.equals(galleryId) & t.page.equals(page))
      ..limit(1);

    return query.getSingleOrNull();
  }

  Future<void> upsertEntry(DownloadedImageEntry entry) async {
    _log.fine('upsertEntry: $entry');
    await into(downloadedImages).insertOnConflictUpdate(entry);
  }

  Future<void> deleteEntry(int galleryId, int page) async {
    _log.fine('deleteEntry: galleryId=$galleryId, page=$page');
    final query = delete(downloadedImages)
      ..where((t) => t.galleryId.equals(galleryId) & t.page.equals(page));

    await query.go();
  }

  Future<List<DownloadedImageEntry>> listByGalleryId(int galleryId) async {
    _log.fine('listByGalleryId: galleryId=$galleryId');
    final query = select(downloadedImages)
      ..where((t) => t.galleryId.equals(galleryId))
      ..orderBy([
        (t) => OrderingTerm.asc(t.page),
      ]);

    return query.get();
  }

  Future<void> deleteByGalleryId(int galleryId) async {
    _log.fine('deleteByGalleryId: galleryId=$galleryId');
    final query = delete(downloadedImages)
      ..where((t) => t.galleryId.equals(galleryId));

    await query.go();
  }
}
