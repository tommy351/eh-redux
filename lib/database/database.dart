import 'dart:async';
import 'dart:io';
import 'dart:isolate';
import 'dart:ui';

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

  static const _requestPortName = 'database.request';
  static const _instancePortName = 'database.instance';

  static Future<String> _getDatabasePath() async {
    final dir = await getApplicationDocumentsDirectory();
    return join(dir.path, 'db.sqlite');
  }

  static LazyDatabase _openConnection() {
    return LazyDatabase(() async {
      return VmDatabase(File(await _getDatabasePath()));
    });
  }

  static Future<MoorIsolate> createIsolate() async {
    final path = await _getDatabasePath();
    final receivePort = ReceivePort();

    await Isolate.spawn(
      _startBackground,
      _IsolateStartRequest(receivePort.sendPort, path),
    );

    return await receivePort.first as MoorIsolate;
  }

  static void _startBackground(_IsolateStartRequest request) {
    final executor = VmDatabase(File(request.targetPath));
    final moorIsolate = MoorIsolate.inCurrent(
      () => DatabaseConnection.fromExecutor(executor),
    );

    request.sendMoorIsolate.send(moorIsolate);
  }

  static void shareIsolate(MoorIsolate isolate) {
    final requestPort = ReceivePort();

    requestPort.listen((message) {
      final instancePort =
          IsolateNameServer.lookupPortByName(_instancePortName);
      instancePort?.send(isolate.connectPort);
    });

    IsolateNameServer.removePortNameMapping(_requestPortName);
    IsolateNameServer.registerPortWithName(
        requestPort.sendPort, _requestPortName);
  }

  static Future<MoorIsolate> reuseIsolate() async {
    final shareRequestPort =
        IsolateNameServer.lookupPortByName(_requestPortName);
    if (shareRequestPort == null) return null;

    final instancePort = ReceivePort();

    try {
      IsolateNameServer.registerPortWithName(
          instancePort.sendPort, _instancePortName);

      shareRequestPort.send(null);

      final connectPort = await instancePort.first as SendPort;

      return MoorIsolate.fromConnectPort(connectPort);
    } finally {
      IsolateNameServer.removePortNameMapping(_instancePortName);
      instancePort.close();
    }
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
