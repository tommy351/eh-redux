import 'package:eh_redux/modules/download/tasks/delete.dart';
import 'package:eh_redux/modules/download/tasks/download.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:logging/logging.dart';

final _log = Logger('backgroundTaskHandler');

enum TaskTag {
  download,
  deleteDownload,
}

Future<bool> backgroundTaskHandler(
  String taskName,
  Map<String, dynamic> inputData,
) async {
  _log.finer('Received task: name=$taskName, data=$inputData');

  switch (EnumToString.fromString(TaskTag.values, taskName)) {
    case TaskTag.download:
      final handler = DownloadTaskHandler();
      return handler.handle(inputData);

    case TaskTag.deleteDownload:
      final handler = DeleteDownloadTaskHandler();
      return handler.handle(inputData);
  }

  return true;
}
