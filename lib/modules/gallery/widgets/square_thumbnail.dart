import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';

import 'thumbnail.dart';

part 'square_thumbnail.g.dart';

@swidget
Widget gallerySquareThumbnail(
  BuildContext context, {
  @required int galleryId,
  @required String fallbackUrl,
  double size,
  BorderRadius borderRadius,
}) {
  return AspectRatio(
    aspectRatio: 1,
    child: ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(16),
      child: GalleryThumbnail(
        galleryId: galleryId,
        fallbackUrl: fallbackUrl,
        width: size,
        height: size,
        fit: BoxFit.cover,
      ),
    ),
  );
}
