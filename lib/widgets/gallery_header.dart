import 'package:ehreader/models/gallery.dart';
import 'package:ehreader/widgets/rating_bar.dart';
import 'package:flutter/material.dart';

class GalleryHeader extends StatelessWidget {
  final Gallery gallery;

  const GalleryHeader(
    this.gallery, {
    Key key,
  })  : assert(gallery != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: <Widget>[
        Expanded(
          child: Text(
            '${gallery.category} / ${gallery.fileCount}P',
            style: theme.textTheme.caption,
          ),
        ),
        Text(
          '${gallery.rating}',
          style: theme.textTheme.caption,
        ),
        RatingBar(
          gallery.rating,
          size: 16,
          color: theme.primaryColor,
        ),
      ],
    );
  }
}
