// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'body.dart';

// **************************************************************************
// FunctionalWidgetGenerator
// **************************************************************************

class _StatusBar extends StatelessWidget {
  const _StatusBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext _context) => _statusBar(_context);
}

class _ImageLoading extends StatelessWidget {
  const _ImageLoading({Key key, this.event}) : super(key: key);

  final ImageChunkEvent event;

  @override
  Widget build(BuildContext _context) => _imageLoading(_context, event: event);
}

class _ImageView extends StatelessWidget {
  const _ImageView({Key key, @required this.page}) : super(key: key);

  final int page;

  @override
  Widget build(BuildContext _context) => _imageView(_context, page: page);
}

class _ImageError extends StatelessWidget {
  const _ImageError({Key key, @required this.page, this.error, this.reloadKey})
      : super(key: key);

  final int page;

  final ImageError error;

  final String reloadKey;

  @override
  Widget build(BuildContext _context) =>
      _imageError(_context, page: page, error: error, reloadKey: reloadKey);
}
