import 'package:ehreader/models/gallery.dart';
import 'package:ehreader/widgets/gallery_list.dart';
import 'package:flutter/material.dart';

class FavoriteTab extends StatelessWidget {
  const FavoriteTab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GalleryList(
      paginationKey: GalleryPaginationKeyFavorite(),
    );
  }
}
