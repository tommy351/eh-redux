import 'dart:developer' as developer;

import 'package:moor/moor.dart';

import 'database.dart';

part 'downloaded_image.g.dart';

@DataClassName('DownloadedImageEntry')
class DownloadedImages extends Table {
  IntColumn get galleryId => integer()();
  IntColumn get imagePage => integer()();
  DateTimeColumn get downloadedAt => dateTime()();
  IntColumn get width => integer()();
  IntColumn get height => integer()();
  IntColumn get size => integer()();
  TextColumn get path => text()();

  @override
  Set<Column> get primaryKey => {galleryId, imagePage};
}

@UseDao(tables: [DownloadedImages])
class DownloadedImagesDao extends DatabaseAccessor<Database>
    with _$DownloadedImagesDaoMixin {
  DownloadedImagesDao(Database db) : super(db);

  Future<void> insertEntry(DownloadedImageEntry entry) async {
    developer.log('Insert downloaded image: $entry');
    await into(downloadedImages).insertOnConflictUpdate(entry);
  }

  Future<DownloadedImageEntry> getEntry(int galleryId, int imagePage) async {
    developer.log(
        'Get downloaded image (galleryId=$galleryId, imagePage=$imagePage)');
    final query = select(downloadedImages)
      ..where((t) => t.galleryId.equals(galleryId))
      ..where((t) => t.imagePage.equals(imagePage));

    return query.getSingle();
  }
}
