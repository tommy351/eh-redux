// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'thumbnail.dart';

// **************************************************************************
// FunctionalWidgetGenerator
// **************************************************************************

class GalleryThumbnail extends StatelessWidget {
  const GalleryThumbnail(
      {Key key,
      @required this.galleryId,
      @required this.fallbackUrl,
      this.width,
      this.height,
      this.fit})
      : super(key: key);

  final int galleryId;

  final String fallbackUrl;

  final double width;

  final double height;

  final BoxFit fit;

  @override
  Widget build(BuildContext _context) => galleryThumbnail(_context,
      galleryId: galleryId,
      fallbackUrl: fallbackUrl,
      width: width,
      height: height,
      fit: fit);
}
