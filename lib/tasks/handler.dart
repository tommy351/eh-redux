import 'package:eh_redux/database/database.dart';
import 'package:eh_redux/modules/download/tasks/delete.dart';
import 'package:eh_redux/modules/download/tasks/download.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:logging/logging.dart';
import 'package:meta/meta.dart';

enum TaskTag {
  download,
  deleteDownload,
}

class BackgroundTaskHandler {
  BackgroundTaskHandler({
    @required this.database,
  }) : assert(database != null);

  static final _log = Logger('BackgroundTaskHandler');

  final Database database;

  Future<bool> handle(
    String taskName,
    Map<String, dynamic> inputData,
  ) async {
    _log.finer('Received task: name=$taskName, data=$inputData');

    switch (EnumToString.fromString(TaskTag.values, taskName)) {
      case TaskTag.download:
        final handler = DownloadTaskHandler(database: database);
        return handler.handle(inputData);

      case TaskTag.deleteDownload:
        final handler = DeleteDownloadTaskHandler(database: database);
        return handler.handle(inputData);
    }

    return true;
  }
}
