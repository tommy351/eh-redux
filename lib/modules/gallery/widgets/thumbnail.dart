import 'dart:io';

import 'package:eh_redux/database/database.dart';
import 'package:eh_redux/modules/image/file_fallback_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:octo_image/octo_image.dart';
import 'package:provider/provider.dart';

part 'thumbnail.g.dart';

@swidget
Widget galleryThumbnail(
  BuildContext context, {
  @required int galleryId,
  @required String fallbackUrl,
  double width,
  double height,
  BoxFit fit,
}) {
  final database = Provider.of<Database>(context);

  return OctoImage(
    image: FileFallbackImage(
      getFile: () async {
        final task = await database.downloadTasksDao.getSingle(galleryId);
        final thumbnail = task?.thumbnail;

        if (thumbnail != null && thumbnail.isNotEmpty) {
          return File(thumbnail);
        }

        return null;
      },
      url: fallbackUrl,
      cacheManager: DefaultCacheManager(),
    ),
    width: width,
    height: height,
    fit: fit,
  );
}
