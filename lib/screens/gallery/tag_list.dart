import 'package:collection/collection.dart';
import 'package:eh_redux/generated/l10n.dart';
import 'package:eh_redux/models/gallery.dart';
import 'package:eh_redux/screens/gallery/title.dart';
import 'package:eh_redux/screens/search/args.dart';
import 'package:eh_redux/screens/search/screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GalleryTagList extends StatelessWidget {
  const GalleryTagList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverSafeArea(
      top: false,
      bottom: false,
      sliver: SliverPadding(
        padding: const EdgeInsets.only(bottom: 16),
        sliver: _buildSliverList(context),
      ),
    );
  }

  Widget _buildSliverList(BuildContext context) {
    final gallery = Provider.of<Gallery>(context);
    final groups = groupBy<GalleryTag, String>(
        gallery.tags, (tag) => tag.namespace.isEmpty ? 'misc' : tag.namespace);
    final title = GallerySectionTitle(title: Text(S.of(context).tags));

    if (groups.isEmpty) {
      return SliverList(
        delegate: SliverChildListDelegate.fixed([
          title,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(S.of(context).tagListEmpty),
          ),
        ]),
      );
    }

    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        if (index == 0) {
          return title;
        }

        final entry = groups.entries.elementAt(index - 1);

        return Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 8),
              child: Text(entry.key),
            ),
            Expanded(
              child: Container(
                height: 44,
                child: _buildTags(context, entry.value),
              ),
            ),
          ],
        );
      }, childCount: groups.length + 1),
    );
  }

  Widget _buildTags(BuildContext context, Iterable<GalleryTag> tags) {
    return ListView.separated(
      padding: const EdgeInsets.only(right: 16) +
          MediaQuery.of(context).padding.copyWith(
                top: 0,
                left: 0,
                bottom: 0,
              ),
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return ActionChip(
          onPressed: () {
            Navigator.pushNamed(
              context,
              SearchScreen.routeName,
              arguments:
                  SearchScreenArguments(query: tags.elementAt(index).fullTag),
            );
          },
          label: Text(tags.elementAt(index).tag),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(width: 8),
      itemCount: tags.length,
    );
  }
}
