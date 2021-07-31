import 'package:eh_redux/database/database.dart';
import 'package:eh_redux/modules/common/widgets/loading_dialog.dart';
import 'package:eh_redux/modules/download/controller.dart';
import 'package:eh_redux/modules/download/types.dart';
import 'package:eh_redux/modules/home/widgets/body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:provider/provider.dart';

import 'list.dart';

part 'tab.g.dart';

@swidget
Widget downloadTab(BuildContext context) {
  final database = Provider.of<Database>(context);

  return StreamProvider<List<DownloadTaskWithGallery>>(
    initialData: [],
    create: (_) => database.downloadTasksDao.watchAllWithGallery(),
    child: NestedScrollView(
      headerSliverBuilder: (context, _) => const [_AppBar()],
      body: const _Content(),
    ),
  );
}

@swidget
Widget _appBar(BuildContext context) {
  return SliverAppBar(
    title: Text(AppLocalizations.of(context)!.homeTabTitleDownload),
    pinned: true,
    actions: const [
      _ResumeAllButton(),
      _PauseAllButton(),
    ],
  );
}

@swidget
Widget _resumeAllButton(BuildContext context) {
  final controller = Provider.of<DownloadController>(context);

  return IconButton(
    icon: const Icon(Icons.play_arrow),
    tooltip: AppLocalizations.of(context)!.downloadResumeAllButtonTooltip,
    onPressed: () async {
      final count = await showLoadingDialog(
              context: context, future: controller.resumeAll()) ??
          0;

      if (count > 0) {
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text(AppLocalizations.of(context)!.downloadResumedHint),
        ));
      }
    },
  );
}

@swidget
Widget _pauseAllButton(BuildContext context) {
  final controller = Provider.of<DownloadController>(context);

  return IconButton(
    icon: const Icon(Icons.pause),
    tooltip: AppLocalizations.of(context)!.downloadPauseAllButtonTooltip,
    onPressed: () async {
      final count = await showLoadingDialog(
              context: context, future: controller.pauseAll()) ??
          0;

      if (count > 0) {
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text(AppLocalizations.of(context)!.downloadPausedHint),
        ));
      }
    },
  );
}

@swidget
Widget _content(BuildContext context) {
  final data = Provider.of<List<DownloadTaskWithGallery>>(context);

  return HomeBody(
    child: DownloadList(data: data),
  );
}
