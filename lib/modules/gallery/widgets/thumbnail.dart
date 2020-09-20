import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:eh_redux/database/database.dart';
import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';
import 'package:provider/provider.dart';

class GalleryThumbnail extends StatefulWidget {
  const GalleryThumbnail({
    Key key,
    @required this.galleryId,
    @required this.fallbackUrl,
    this.width,
    this.height,
    this.fit,
  })  : assert(galleryId != null),
        assert(fallbackUrl != null),
        super(key: key);

  final int galleryId;
  final String fallbackUrl;
  final double width;
  final double height;
  final BoxFit fit;

  @override
  _GalleryThumbnailState createState() => _GalleryThumbnailState();
}

class _GalleryThumbnailState extends State<GalleryThumbnail> {
  Future<ImageProvider> _providerFuture;

  @override
  void initState() {
    super.initState();
    _providerFuture = _getImageProvider();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ImageProvider>(
      future: _providerFuture,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Container();
        }

        return OctoImage(
          image: snapshot.data,
          width: widget.width,
          height: widget.height,
          fit: widget.fit,
        );
      },
    );
  }

  Future<ImageProvider> _getImageProvider() async {
    final database = Provider.of<Database>(context, listen: false);
    final entry = await database.downloadTasksDao.getSingle(widget.galleryId);
    final thumbnail = entry?.thumbnail;

    if (thumbnail != null && thumbnail.isNotEmpty) {
      final file = File(thumbnail);

      if (await file.exists()) {
        return FileImage(file);
      }
    }

    return CachedNetworkImageProvider(widget.fallbackUrl);
  }
}
