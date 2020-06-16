import 'package:collection/collection.dart';
import 'package:eh_redux/models/gallery.dart';
import 'package:eh_redux/screens/search/args.dart';
import 'package:eh_redux/screens/search/screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GalleryTagList extends StatelessWidget {
  const GalleryTagList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final gallery = Provider.of<Gallery>(context);
    final theme = Theme.of(context);
    final padding = MediaQuery.of(context).padding.copyWith(top: 0) +
        const EdgeInsets.all(16);

    return Padding(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Tags',
            style: theme.textTheme.headline6
                .copyWith(fontWeight: FontWeight.normal),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: _buildGroups(gallery.tags),
          ),
        ],
      ),
    );
  }

  Widget _buildGroups(Iterable<GalleryTag> tags) {
    if (tags.isEmpty) {
      return const Text('No tags');
    }

    final groups = groupBy<GalleryTag, String>(
        tags, (tag) => tag.namespace.isEmpty ? 'misc' : tag.namespace);

    return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Row(
          children: <Widget>[
            Text(groups.keys.elementAt(index)),
            const SizedBox(width: 8),
            Expanded(
              child: Container(
                height: 44,
                child: _buildTags(groups.values.elementAt(index)),
              ),
            ),
          ],
        );
      },
      itemCount: groups.length,
    );
  }

  Widget _buildTags(Iterable<GalleryTag> tags) {
    return ListView.separated(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return ActionChip(
          onPressed: () {
            Navigator.pushNamed(context, SearchScreen.routeName,
                arguments: SearchScreenArguments(
                  (b) => b..query = tags.elementAt(index).fullTag(),
                ));
          },
          label: Text(tags.elementAt(index).tag),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(width: 8),
      itemCount: tags.length,
    );
  }
}
