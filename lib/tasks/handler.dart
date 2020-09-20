import 'dart:async';

import 'package:async/async.dart';
import 'package:eh_redux/database/database.dart';
import 'package:eh_redux/modules/download/tasks/download.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:logging/logging.dart';

enum TaskTag {
  download,
}

class BackgroundTaskHandler {
  static final _log = Logger('BackgroundTaskHandler');

  final _databaseMemo = AsyncMemoizer<Database>();

  Future<Database> get _database => _databaseMemo.runOnce(() async {
        final isolate =
            await Database.reuseIsolate() ?? await Database.createIsolate();
        return Database.connect(await isolate.connect());
      });

  Future<bool> handle(
    String taskName,
    Map<String, dynamic> inputData,
  ) async {
    _log.fine('Handle: name=$taskName, data=$inputData');

    switch (EnumToString.fromString(TaskTag.values, taskName)) {
      case TaskTag.download:
        final handler = DownloadTaskHandler(
          database: await _database,
        );
        return handler.handle(inputData);
    }

    return true;
  }
}
