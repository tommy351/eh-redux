import 'package:eh_redux/models/category_colors.dart';
import 'package:eh_redux/models/gallery.dart';
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
    const categoryIndicatorSize = 14.0;

    return Row(
      children: <Widget>[
        Expanded(
          child: Row(
            children: <Widget>[
              Container(
                width: categoryIndicatorSize,
                height: categoryIndicatorSize,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: categoryColors[gallery.category] ?? categoryColors[''],
                ),
              ),
              const SizedBox(width: 6),
              Text(
                '${gallery.category} / ${gallery.fileCount}P',
                style: theme.textTheme.caption,
              ),
            ],
          ),
        ),
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
