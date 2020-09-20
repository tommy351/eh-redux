import 'package:eh_redux/modules/common/widgets/rating_bar.dart';
import 'package:eh_redux/modules/gallery/types.dart';
import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';

import 'category_icon.dart';
import 'category_label.dart';
import 'screen.dart';
import 'square_thumbnail.dart';
import 'title.dart';

part 'list.g.dart';

@swidget
Widget galleryList(
  BuildContext context, {
  @required Iterable<Gallery> data,
  Widget footer,
}) {
  return ListView.builder(
    itemCount: data.length + (footer == null ? 0 : 1),
    itemBuilder: (context, index) {
      if (footer != null && index >= data.length) {
        return footer;
      }

      return _GalleryCell(gallery: data.elementAt(index));
    },
  );
}

@swidget
Widget _galleryCell(BuildContext context, {@required Gallery gallery}) {
  return InkWell(
    onTap: () {
      Navigator.pushNamed(context, GalleryScreen.route, arguments: gallery);
    },
    child: SizedBox(
      height: 116,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: GallerySquareThumbnail(
              galleryId: gallery.id,
              fallbackUrl: gallery.thumbnail,
            ),
          ),
          Expanded(
            child: _CellRight(gallery: gallery),
          ),
        ],
      ),
    ),
  );
}

@swidget
Widget _cellRight(
  BuildContext context, {
  @required Gallery gallery,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: _CellTitle(
                  title: gallery.title,
                  titleJpn: gallery.titleJpn,
                ),
              ),
              _CellTags(tags: gallery.tags),
              const SizedBox(height: 8),
              _CellFooter(gallery: gallery),
            ],
          ),
        ),
      ),
      const Divider(height: 1),
    ],
  );
}

@swidget
Widget _cellTitle(
  BuildContext context, {
  @required String title,
  String titleJpn = '',
}) {
  final theme = Theme.of(context);

  return DefaultTextStyle(
    style: theme.textTheme.subtitle1.copyWith(height: 1.4),
    maxLines: 2,
    overflow: TextOverflow.ellipsis,
    child: GalleryTitle(
      title: title,
      titleJpn: titleJpn,
    ),
  );
}

@swidget
Widget _cellTags(BuildContext context, {@required Iterable<GalleryTag> tags}) {
  final theme = Theme.of(context);

  return Text(
    tags.map((e) => e.shortTag).join(', '),
    style: theme.textTheme.caption,
    maxLines: 1,
    overflow: TextOverflow.ellipsis,
  );
}

@swidget
Widget _cellFooter(BuildContext context, {@required Gallery gallery}) {
  final theme = Theme.of(context);

  return DefaultTextStyle(
    style: theme.textTheme.caption,
    child: IconTheme(
      data: IconThemeData(
        size: 16,
        color: theme.accentColor,
      ),
      child: Row(
        children: [
          CategoryIcon(category: gallery.category),
          const SizedBox(width: 4),
          CategoryLabel(category: gallery.category),
          Text(' / ${gallery.fileCount}P'),
          const Spacer(),
          Text(gallery.rating.toStringAsFixed(2)),
          const SizedBox(width: 4),
          RatingBar(gallery.rating),
        ],
      ),
    ),
  );
}
