import 'dart:async';
import 'dart:io';
import 'dart:isolate';

import 'package:eh_redux/modules/download/daos/image.dart';
import 'package:eh_redux/modules/download/daos/task.dart';
import 'package:eh_redux/modules/download/types.dart';
import 'package:eh_redux/modules/gallery/dao.dart';
import 'package:eh_redux/modules/history/dao.dart';
import 'package:eh_redux/modules/search/dao.dart';
import 'package:moor/ffi.dart';
import 'package:moor/isolate.dart';
import 'package:moor/moor.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import 'converter.dart';

part 'database.g.dart';

Future<String> _getDatabasePath() async {
  final dir = await getApplicationDocumentsDirectory();
  return join(dir.path, 'db.sqlite');
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    return VmDatabase(File(await _getDatabasePath()));
  });
}

Future<MoorIsolate> _createMoorIsolate() async {
  final path = await _getDatabasePath();
  final receivePort = ReceivePort();

  await Isolate.spawn(
    _startBackground,
    _IsolateStartRequest(receivePort.sendPort, path),
  );

  return await receivePort.first as MoorIsolate;
}

void _startBackground(_IsolateStartRequest request) {
  final executor = VmDatabase(File(request.targetPath));
  final moorIsolate = MoorIsolate.inCurrent(
    () => DatabaseConnection.fromExecutor(executor),
  );

  request.sendMoorIsolate.send(moorIsolate);
}

class _IsolateStartRequest {
  _IsolateStartRequest(this.sendMoorIsolate, this.targetPath);

  final SendPort sendMoorIsolate;
  final String targetPath;
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

  Database.connect(DatabaseConnection connection) : super.connect(connection);

  static Completer<Database> _instanceCompleter;

  static Future<DatabaseConnection> getConnection() async {
    final isolate = await _createMoorIsolate();
    return isolate.connect();
  }

  static Future<Database> get instance async {
    if (_instanceCompleter == null) {
      _instanceCompleter = Completer();

      getConnection().then((connection) {
        final db = Database.connect(connection);
        _instanceCompleter.complete(db);
      });
    }

    return _instanceCompleter.future;
  }

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
