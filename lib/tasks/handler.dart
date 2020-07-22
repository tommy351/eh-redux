import 'download.dart';

const downloadTaskKey = 'download';

const _taskTagPrefix = 'app.ehredux/';
const downloadTaskTag = '$_taskTagPrefix$downloadTaskKey';

Future<bool> backgroundTaskHandler(
  String taskName,
  Map<String, dynamic> inputData,
) async {
  switch (taskName) {
    case downloadTaskKey:
      final handler = DownloadTaskHandler();
      return handler.handle(inputData);
  }

  return true;
}
