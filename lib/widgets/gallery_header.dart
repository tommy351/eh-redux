import 'package:eh_redux/models/gallery.dart';
import 'package:eh_redux/widgets/category_label.dart';
import 'package:eh_redux/widgets/rating_bar.dart';
import 'package:flutter/material.dart';

class GalleryHeader extends StatelessWidget {
  const GalleryHeader(
    this.gallery, {
    Key key,
  })  : assert(gallery != null),
        super(key: key);

  final Gallery gallery;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: <Widget>[
        DefaultTextStyle(
          style: theme.textTheme.caption,
          child: CategoryLabel(
            category: gallery.category,
            indicatorSize: 14,
            labelBuilder: (label) => '$label / ${gallery.fileCount}P',
          ),
        ),
        const Spacer(),
        Text(
          '${gallery.rating}',
          style: theme.textTheme.caption,
        ),
        RatingBar(
          gallery.rating,
          size: 16,
          color: theme.accentColor,
        ),
      ],
    );
  }
}
