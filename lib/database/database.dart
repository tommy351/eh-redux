import 'dart:io';

import 'package:eh_redux/modules/download/daos/image.dart';
import 'package:eh_redux/modules/download/daos/task.dart';
import 'package:eh_redux/modules/download/types.dart';
import 'package:eh_redux/modules/gallery/dao.dart';
import 'package:eh_redux/modules/history/dao.dart';
import 'package:eh_redux/modules/search/dao.dart';
import 'package:moor/ffi.dart';
import 'package:moor/moor.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import 'converter.dart';

part 'database.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(join(dbFolder.path, 'db.sqlite'));
    return VmDatabase(file);
  });
}

@UseMoor(
  tables: [
    Galleries,
    SearchHistories,
    DownloadTasks,
    DownloadedImages,
  ],
  daos: [
    GalleriesDao,
    SearchHistoriesDao,
    DownloadTasksDao,
    DownloadedImagesDao,
    HistoryDao,
  ],
)
class Database extends _$Database {
  Database() : super(_openConnection());

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) {
          return m.createAll();
        },
        onUpgrade: (m, from, to) async {
          if (from == 1) {
            await m.createTable(downloadTasks);
            await m.createTable(downloadedImages);
          }
        },
      );
}
