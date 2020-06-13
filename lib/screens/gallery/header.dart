import 'package:eh_redux/models/category_colors.dart';
import 'package:eh_redux/models/gallery.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GalleryHeader extends StatelessWidget {
  static const _categoryIndicatorSize = 16.0;

  const GalleryHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final gallery = Provider.of<Gallery>(context);
    final padding = MediaQuery.of(context).padding.copyWith(top: 0) +
        const EdgeInsets.all(16);

    return Padding(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildCategory(context, gallery.category),
          _buildTitle(context, gallery.title),
          _buildSubtitle(context, gallery.titleJpn),
        ],
      ),
    );
  }

  Widget _buildCategory(BuildContext context, String category) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: <Widget>[
          Container(
            width: _categoryIndicatorSize,
            height: _categoryIndicatorSize,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: categoryColors[category] ?? categoryColors[''],
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              category,
              style: theme.textTheme.bodyText2,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTitle(BuildContext context, String text) {
    final theme = Theme.of(context);
    return Text(text, style: theme.textTheme.headline6);
  }

  Widget _buildSubtitle(BuildContext context, String text) {
    if (text == null || text.isEmpty) {
      return Container();
    }

    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Text(text,
          style: theme.textTheme.bodyText2.copyWith(
            color: theme.textTheme.caption.color,
          )),
    );
  }
}
