import 'package:ehreader/models/gallery.dart';
import 'package:ehreader/widgets/gallery_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GalleryTab extends StatelessWidget {
  const GalleryTab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GalleryList(
      paginationKey: GalleryPaginationKeyFrontPage(),
    );
  }
}
