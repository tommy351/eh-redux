import 'package:eh_redux/generated/l10n.dart';
import 'package:eh_redux/models/download.dart';
import 'package:flutter/material.dart';

class DownloadTaskCell extends StatelessWidget {
  const DownloadTaskCell({
    Key key,
    @required this.task,
  })  : assert(task != null),
        super(key: key);

  final DownloadTask task;

  @override
  Widget build(BuildContext context) {
    final stateLabelMap = <DownloadTaskState, String>{
      DownloadTaskState.created: S.of(context).downloadStateCreated,
      DownloadTaskState.started: S.of(context).downloadStateStarted,
      DownloadTaskState.paused: S.of(context).downloadStatePaused,
      DownloadTaskState.failed: S.of(context).downloadStateFailed,
      DownloadTaskState.succeeded: S.of(context).downloadStateSucceeded,
    };

    return InkWell(
      onTap: () {
        //
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('${task.galleryId}'),
            Text(
                '${stateLabelMap[task.state]} (${task.current}/${task.total})'),
            SizedBox(
              height: 4,
              child: LinearProgressIndicator(
                value: task.current / task.total,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
