import 'package:eh_redux/models/download.dart';
import 'package:flutter/material.dart';

import 'task_cell.dart';

class DownloadTaskList extends StatelessWidget {
  const DownloadTaskList({
    Key key,
    @required this.tasks,
  })  : assert(tasks != null),
        super(key: key);

  final Iterable<DownloadTask> tasks;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        final task = tasks.elementAt(index);

        return DownloadTaskCell(
          task: task,
        );
      },
    );
  }
}
