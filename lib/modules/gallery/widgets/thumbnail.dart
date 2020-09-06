import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';

part 'thumbnail.g.dart';

@swidget
Widget galleryThumbnail(
  BuildContext context, {
  @required String url,
  double size,
  BorderRadius borderRadius = BorderRadius.zero,
}) {
  return ClipRRect(
    borderRadius: borderRadius,
    child: CachedNetworkImage(
      imageUrl: url,
      width: size,
      height: size,
      fit: BoxFit.cover,
    ),
  );
}
