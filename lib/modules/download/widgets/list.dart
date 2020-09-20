import 'package:eh_redux/generated/l10n.dart';
import 'package:eh_redux/modules/download/types.dart';
import 'package:eh_redux/modules/gallery/widgets/screen.dart';
import 'package:eh_redux/modules/gallery/widgets/thumbnail.dart';
import 'package:eh_redux/modules/gallery/widgets/title.dart';
import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';

import 'menu_bottom_sheet.dart';

part 'list.g.dart';

@swidget
Widget downloadList(
  BuildContext context, {
  @required Iterable<DownloadTaskWithGallery> data,
}) {
  return ListView.builder(
    itemCount: data.length,
    itemBuilder: (context, index) {
      return _DownloadCell(task: data.elementAt(index));
    },
  );
}

@swidget
Widget _downloadCell(
  BuildContext context, {
  @required DownloadTaskWithGallery task,
}) {
  return InkWell(
    onTap: () {
      Navigator.pushNamed(context, GalleryScreen.route,
          arguments: task.gallery);
    },
    onLongPress: () {
      showDownloadMenuBottomSheet(
        context: context,
        task: task.task,
      );
    },
    child: SizedBox(
      height: 116,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: AspectRatio(
              aspectRatio: 1,
              child: GalleryThumbnail(
                url: task.gallery.thumbnail,
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: _CellRight(task: task),
                      ),
                      _MenuButton(task: task.task),
                    ],
                  ),
                ),
                const Divider(height: 1),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

@swidget
Widget _cellRight(
  BuildContext context, {
  @required DownloadTaskWithGallery task,
}) {
  return Padding(
    padding: const EdgeInsets.all(8),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _CellTitle(
          title: task.gallery.title,
          titleJpn: task.gallery.titleJpn,
        ),
        const Spacer(),
        _ProgressBar(task: task.task),
      ],
    ),
  );
}

@swidget
Widget _cellTitle(
  BuildContext context, {
  @required String title,
  String titleJpn = '',
}) {
  final theme = Theme.of(context);

  return DefaultTextStyle(
    style: theme.textTheme.subtitle1.copyWith(height: 1.4),
    maxLines: 2,
    overflow: TextOverflow.ellipsis,
    child: GalleryTitle(
      title: title,
      titleJpn: titleJpn,
    ),
  );
}

@swidget
Widget _progressBar(
  BuildContext context, {
  @required DownloadTask task,
}) {
  final theme = Theme.of(context);
  final statusText = <DownloadTaskState, String>{
    DownloadTaskState.pending: S.of(context).downloadTaskStatePending,
    DownloadTaskState.downloading: S.of(context).downloadTaskStateDownloading,
    DownloadTaskState.paused: S.of(context).downloadTaskStatePaused,
    DownloadTaskState.succeeded: S.of(context).downloadTaskStateSucceeded,
    DownloadTaskState.failed: S.of(context).downloadTaskStateFailed,
    DownloadTaskState.deleting: S.of(context).downloadTaskStateDeleting,
  };
  final statusIcon = <DownloadTaskState, Icon>{
    DownloadTaskState.pending: const Icon(Icons.schedule),
    DownloadTaskState.downloading: const Icon(Icons.file_download),
    DownloadTaskState.paused: const Icon(Icons.pause),
    DownloadTaskState.succeeded: const Icon(Icons.check, color: Colors.green),
    DownloadTaskState.failed: Icon(Icons.error, color: theme.errorColor),
    DownloadTaskState.deleting: const Icon(Icons.delete_forever),
  };

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      DefaultTextStyle(
        style: theme.textTheme.caption,
        child: Row(
          children: [
            IconTheme(
              data: IconThemeData(size: 16, color: theme.hintColor),
              child: statusIcon[task.state],
            ),
            const SizedBox(width: 4),
            Text(statusText[task.state]),
            const Spacer(),
            Text(
                '${task.downloadedCount}/${task.totalCount} (${(task.downloadedCount / task.totalCount * 100).round()}%)'),
          ],
        ),
      ),
      const SizedBox(height: 8),
      LinearProgressIndicator(
        value: task.downloadedCount / task.totalCount,
      ),
      const SizedBox(height: 4),
    ],
  );
}

@swidget
Widget _menuButton(
  BuildContext context, {
  @required DownloadTask task,
}) {
  return IconButton(
    onPressed: () {
      showDownloadMenuBottomSheet(
        context: context,
        task: task,
      );
    },
    icon: const Icon(Icons.more_vert),
  );
}
