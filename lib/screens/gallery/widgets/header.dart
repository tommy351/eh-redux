import 'package:eh_redux/models/gallery.dart';
import 'package:eh_redux/widgets/category_label.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GalleryHeader extends StatelessWidget {
  const GalleryHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final gallery = Provider.of<Gallery>(context);

    return SliverSafeArea(
      top: false,
      bottom: false,
      sliver: SliverPadding(
        padding: const EdgeInsets.all(16),
        sliver: SliverList(
          delegate: SliverChildListDelegate.fixed([
            _buildCategory(context, gallery.category),
            _buildTitle(context, gallery.title),
            _buildSubtitle(context, gallery.titleJpn),
          ]),
        ),
      ),
    );
  }

  Widget _buildCategory(BuildContext context, String category) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: CategoryLabel(
        category: category,
        indicatorSize: 16,
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
