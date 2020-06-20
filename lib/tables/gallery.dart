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
}
