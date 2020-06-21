import 'dart:developer' as developer;

import 'package:eh_redux/models/gallery.dart';
import 'package:moor/moor.dart';

import 'converter.dart';
import 'database.dart';

part 'gallery.g.dart';

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

  Future<void> insertEntry(GalleryEntry entry) async {
    developer.log('Insert gallery: $entry');
    await into(galleries).insertOnConflictUpdate(entry);
  }

  Future<List<GalleryEntry>> listEntries() async {
    developer.log('List galleries');
    final query = select(galleries)
      ..orderBy([
        (e) => OrderingTerm(expression: e.lastReadAt, mode: OrderingMode.desc),
      ]);

    return query.get();
  }

  Future<void> deleteAllEntries() async {
    developer.log('Clear galleries');
    await delete(galleries).go();
  }

  Future<GalleryEntry> getEntry(int id) async {
    developer.log('Get gallery (id: $id)');
    final query = select(galleries)..where((t) => t.id.equals(id));
    return query.getSingle();
  }

  Future<void> updateReadPosition(int id, GalleryReadPosition pos) async {
    developer.log('Update gallery read position (id: $id, position: $pos)');
    final query = update(galleries)..where((t) => t.id.equals(id));

    await query.write(GalleriesCompanion(
      lastReadAt: Value(pos.time),
      lastReadPage: Value(pos.page),
    ));
  }
}
