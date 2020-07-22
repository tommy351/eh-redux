import 'package:eh_redux/generated/l10n.dart';
import 'package:eh_redux/screens/download/widgets/task_list.dart';
import 'package:eh_redux/stores/download.dart';
import 'package:eh_redux/widgets/stateful_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'scroll_view.dart';

class DownloadTab extends StatelessWidget {
  const DownloadTab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final downloadStore = Provider.of<DownloadStore>(context);

    return HomeScrollView(
      headerSliverBuilder: (context, _) => [
        SliverAppBar(
          title: Text(S.of(context).downloads),
          pinned: true,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.play_arrow),
              tooltip: S.of(context).startAll,
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.pause),
              tooltip: S.of(context).pauseAll,
              onPressed: () {
                //
              },
            ),
            IconButton(
              icon: const Icon(Icons.delete),
              tooltip: S.of(context).delete,
              onPressed: () {
                //
              },
            ),
          ],
        )
      ],
      body: SafeArea(
        top: false,
        bottom: false,
        child: StatefulWrapper(
          onInit: (context) {
            final sub = downloadStore.watchAll();
            return () {
              sub.cancel();
            };
          },
          builder: (context) {
            return DownloadTaskList(
              tasks: downloadStore.data.values,
            );
          },
        ),
      ),
    );
  }
}
