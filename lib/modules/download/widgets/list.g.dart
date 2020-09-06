// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list.dart';

// **************************************************************************
// FunctionalWidgetGenerator
// **************************************************************************

class DownloadList extends StatelessWidget {
  const DownloadList({Key key, @required this.data}) : super(key: key);

  final Iterable<DownloadTaskWithGallery> data;

  @override
  Widget build(BuildContext _context) => downloadList(_context, data: data);
}

class _DownloadCell extends StatelessWidget {
  const _DownloadCell({Key key, @required this.task}) : super(key: key);

  final DownloadTaskWithGallery task;

  @override
  Widget build(BuildContext _context) => _downloadCell(_context, task: task);
}

class _CellRight extends StatelessWidget {
  const _CellRight({Key key, @required this.task}) : super(key: key);

  final DownloadTaskWithGallery task;

  @override
  Widget build(BuildContext _context) => _cellRight(_context, task: task);
}

class _CellTitle extends StatelessWidget {
  const _CellTitle({Key key, @required this.title, this.titleJpn = ''})
      : super(key: key);

  final String title;

  final String titleJpn;

  @override
  Widget build(BuildContext _context) =>
      _cellTitle(_context, title: title, titleJpn: titleJpn);
}

class _ProgressBar extends StatelessWidget {
  const _ProgressBar({Key key, @required this.task}) : super(key: key);

  final DownloadTask task;

  @override
  Widget build(BuildContext _context) => _progressBar(_context, task: task);
}

class _MenuButton extends StatelessWidget {
  const _MenuButton({Key key, @required this.task}) : super(key: key);

  final DownloadTask task;

  @override
  Widget build(BuildContext _context) => _menuButton(_context, task: task);
}
