import 'package:ehreader/models/gallery.dart';
import 'package:ehreader/widgets/rating_bar.dart';
import 'package:flutter/material.dart';

class GalleryHeader extends StatelessWidget {
  final Gallery gallery;

  static final _categoryColors = <String, Color>{
    'Doujinshi': Colors.red,
    'Manga': Colors.orange,
    'Artist CG': Colors.yellow,
    'Game CG': Colors.green,
    'Western': Colors.lightGreen,
    'Non-H': Colors.lightBlue,
    'Image Set': Colors.indigo,
    'Cosplay': Colors.purple,
    'Asian Porn': Colors.deepPurple,
    '': Colors.grey,
  };

  const GalleryHeader(
    this.gallery, {
    Key key,
  })  : assert(gallery != null),
        super(key: key);

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
                  color:
                      _categoryColors[gallery.category] ?? _categoryColors[''],
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
          color: theme.primaryColor,
        ),
      ],
    );
  }
}
