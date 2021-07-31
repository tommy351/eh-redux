import 'package:eh_redux/modules/common/widgets/bottom_sheet_container.dart';
import 'package:eh_redux/modules/common/widgets/loading_dialog.dart';
import 'package:eh_redux/modules/download/controller.dart';
import 'package:eh_redux/modules/download/types.dart';
import 'package:eh_redux/modules/setting/widgets/confirm_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:provider/provider.dart';

part 'menu_bottom_sheet.g.dart';

enum _BottomSheetResult {
  pause,
  resume,
  retry,
  delete,
}

Future<void> showDownloadMenuBottomSheet({
  required BuildContext context,
  required DownloadTask task,
}) async {
  final result = await showModalBottomSheet<_BottomSheetResult>(
    context: context,
    isScrollControlled: true,
    builder: (context) {
      return DownloadMenuBottomSheet(task: task);
    },
  );

  if (result == null) return;

  switch (result) {
    case _BottomSheetResult.pause:
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(AppLocalizations.of(context)!.downloadPausedHint),
      ));
      break;

    case _BottomSheetResult.resume:
    case _BottomSheetResult.retry:
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(AppLocalizations.of(context)!.downloadResumedHint),
      ));
      break;

    case _BottomSheetResult.delete:
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(AppLocalizations.of(context)!.downloadDeletedHint),
      ));
      break;
  }
}

@swidget
Widget downloadMenuBottomSheet(
  BuildContext context, {
  required DownloadTask task,
}) {
  return Provider.value(
    value: task,
    child: BottomSheetContainer(
      child: Wrap(
        children: [
          ...[
            DownloadTaskState.downloading,
            DownloadTaskState.pending,
          ].contains(task.state)
              ? [const _PauseButton()]
              : [],
          ...task.state == DownloadTaskState.paused
              ? [const _ResumeButton()]
              : [],
          ...task.state == DownloadTaskState.failed
              ? [const _RetryButton()]
              : [],
          const _DeleteButton(),
        ],
      ),
    ),
  );
}

@swidget
Widget _pauseButton(BuildContext context) {
  final controller = Provider.of<DownloadController>(context);
  final task = Provider.of<DownloadTask>(context);

  return ListTile(
    onTap: () async {
      await showLoadingDialog(
        context: context,
        future: controller.pause(task.galleryId),
      );
      Navigator.pop(context, _BottomSheetResult.pause);
    },
    leading: const Icon(Icons.pause),
    title: Text(AppLocalizations.of(context)!.downloadPauseButtonLabel),
  );
}

@swidget
Widget _resumeButton(BuildContext context) {
  final controller = Provider.of<DownloadController>(context);
  final task = Provider.of<DownloadTask>(context);

  return ListTile(
    onTap: () async {
      await showLoadingDialog(
        context: context,
        future: controller.resume(task.galleryId),
      );
      Navigator.pop(context, _BottomSheetResult.resume);
    },
    leading: const Icon(Icons.play_arrow),
    title: Text(AppLocalizations.of(context)!.downloadResumeButtonLabel),
  );
}

@swidget
Widget _retryButton(BuildContext context) {
  final controller = Provider.of<DownloadController>(context);
  final task = Provider.of<DownloadTask>(context);

  return ListTile(
    onTap: () async {
      await showLoadingDialog(
        context: context,
        future: controller.resume(task.galleryId),
      );
      Navigator.pop(context, _BottomSheetResult.retry);
    },
    leading: const Icon(Icons.refresh),
    title: Text(AppLocalizations.of(context)!.downloadRetryButtonLabel),
  );
}

@swidget
Widget _deleteButton(BuildContext context) {
  final controller = Provider.of<DownloadController>(context);
  final task = Provider.of<DownloadTask>(context);
  final theme = Theme.of(context);

  return ListTileTheme(
    textColor: theme.errorColor,
    iconColor: theme.errorColor,
    child: ConfirmListTile(
      leading: const Icon(Icons.delete_forever),
      title: Text(AppLocalizations.of(context)!.downloadDeleteButtonLabel),
      dialogTitle:
          Text(AppLocalizations.of(context)!.downloadDeleteDialogTitle),
      dialogContent:
          Text(AppLocalizations.of(context)!.downloadDeleteDialogContent),
      onConfirm: () async {
        await showLoadingDialog(
          context: context,
          future: controller.delete(task.galleryId),
        );
        Navigator.pop(context, _BottomSheetResult.delete);
      },
      confirmActionChild:
          Text(AppLocalizations.of(context)!.downloadDeleteButtonLabel),
      disabled: task.state == DownloadTaskState.deleting,
    ),
  );
}
