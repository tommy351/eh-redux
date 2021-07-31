import 'package:eh_redux/database/converter.dart';
import 'package:eh_redux/database/database.dart';
import 'package:eh_redux/modules/gallery/types.dart';
import 'package:logging/logging.dart';
import 'package:moor/moor.dart';

part 'dao.g.dart';

@DataClassName('GalleryEntry')
class Galleries extends Table {
  IntColumn get id => integer()();
  TextColumn get token => text()();
  TextColumn get title => text()();
  TextColumn get titleJpn => text()();
  TextColumn get category => text()();
  TextColumn get thumbnail => text()();
  TextColumn get uploader => text()();
  IntColumn get fileCount => integer()();
  IntColumn get fileSize => integer()();
  BoolColumn get expunged => boolean()();
  RealColumn get rating => real()();
  DateTimeColumn get posted => dateTime()();
  TextColumn get tags => text().map(ListConverter<String>())();
  DateTimeColumn get lastReadAt => dateTime().nullable()();
  IntColumn get lastReadPage => integer().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

@UseDao(tables: [Galleries])
class GalleriesDao extends DatabaseAccessor<Database> with _$GalleriesDaoMixin {
  GalleriesDao(Database db) : super(db);

  static final _log = Logger('GalleriesDao');

  Future<GalleryEntry> getEntry(int id) async {
    _log.fine('getEntry: $id');
    final query = select(galleries)..where((t) => t.id.equals(id));

    return query.getSingle();
  }

  Future<void> upsertEntry(GalleryEntry entry) async {
    _log.fine('upsertEntry: $entry');
    await into(galleries).insertOnConflictUpdate(entry);
  }

  Future<GalleryReadPosition?> getReadPosition(int id) async {
    _log.fine('getReadPosition: $id');
    final query = select(galleries)..where((t) => t.id.equals(id));

    return query.map((e) {
      final page = e.lastReadPage;
      final time = e.lastReadAt;

      if (page != null && time != null) {
        return GalleryReadPosition(
          page: page,
          time: time,
        );
      }

      return null;
    }).getSingle();
  }

  Future<void> updateReadPosition(int id, int page) async {
    _log.fine('updateReadPosition: id=$id, page=$page');
    final query = update(galleries)..where((t) => t.id.equals(id));

    await query.write(GalleriesCompanion(
      lastReadPage: Value(page),
      lastReadAt: Value(DateTime.now()),
    ));
  }
}
