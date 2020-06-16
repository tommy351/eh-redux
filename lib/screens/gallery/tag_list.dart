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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16) +
              MediaQuery.of(context).padding.copyWith(top: 0, bottom: 0),
          child: Text(
            'Tags',
            style: theme.textTheme.headline6
                .copyWith(fontWeight: FontWeight.normal),
          ),
        ),
        _buildGroups(context, gallery.tags),
      ],
    );
  }

  Widget _buildGroups(BuildContext context, Iterable<GalleryTag> tags) {
    if (tags.isEmpty) {
      return const Text('No tags');
    }

    final groups = groupBy<GalleryTag, String>(
        tags, (tag) => tag.namespace.isEmpty ? 'misc' : tag.namespace);

    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 16),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 16) +
                  MediaQuery.of(context).padding.copyWith(
                        top: 0,
                        bottom: 0,
                        right: 8,
                      ),
              child: Text(groups.keys.elementAt(index)),
            ),
            Expanded(
              child: Container(
                height: 44,
                child: _buildTags(context, groups.values.elementAt(index)),
              ),
            ),
          ],
        );
      },
      itemCount: groups.length,
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
