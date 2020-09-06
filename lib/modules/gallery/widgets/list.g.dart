// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list.dart';

// **************************************************************************
// FunctionalWidgetGenerator
// **************************************************************************

class GalleryList extends StatelessWidget {
  const GalleryList({Key key, @required this.data, this.footer})
      : super(key: key);

  final Iterable<Gallery> data;

  final Widget footer;

  @override
  Widget build(BuildContext _context) =>
      galleryList(_context, data: data, footer: footer);
}

class _GalleryCell extends StatelessWidget {
  const _GalleryCell({Key key, @required this.gallery}) : super(key: key);

  final Gallery gallery;

  @override
  Widget build(BuildContext _context) =>
      _galleryCell(_context, gallery: gallery);
}

class _CellRight extends StatelessWidget {
  const _CellRight({Key key, @required this.gallery}) : super(key: key);

  final Gallery gallery;

  @override
  Widget build(BuildContext _context) => _cellRight(_context, gallery: gallery);
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

class _CellTags extends StatelessWidget {
  const _CellTags({Key key, @required this.tags}) : super(key: key);

  final Iterable<GalleryTag> tags;

  @override
  Widget build(BuildContext _context) => _cellTags(_context, tags: tags);
}

class _CellFooter extends StatelessWidget {
  const _CellFooter({Key key, @required this.gallery}) : super(key: key);

  final Gallery gallery;

  @override
  Widget build(BuildContext _context) =>
      _cellFooter(_context, gallery: gallery);
}
