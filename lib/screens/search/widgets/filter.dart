import 'dart:math';

import 'package:eh_redux/generated/l10n.dart';
import 'package:eh_redux/screens/search/store.dart';
import 'package:eh_redux/utils/firebase.dart';
import 'package:eh_redux/widgets/category_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class SearchFilter extends StatefulWidget {
  const SearchFilter({Key key}) : super(key: key);

  @override
  _SearchFilterState createState() => _SearchFilterState();
}

class _SearchFilterState extends State<SearchFilter> {
  static const _categories = <String, int>{
    'Doujinshi': 1 << 1,
    'Manga': 1 << 2,
    'Artist CG': 1 << 3,
    'Game CG': 1 << 4,
    'Western': 1 << 9,
    'Non-H': 1 << 8,
    'Image Set': 1 << 5,
    'Cosplay': 1 << 6,
    'Asian Porn': 1 << 7,
    'Misc': 1 << 0
  };

  @override
  void initState() {
    super.initState();
    analytics.logEvent(name: 'open_search_filter');
  }

  @override
  void dispose() {
    analytics.logEvent(name: 'close_search_filter');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final searchStore = Provider.of<SearchStore>(context);
    final advancedOptions = <String, String>{
      'f_sname': S.of(context).searchGalleryName,
      'f_stags': S.of(context).searchGalleryTags,
      'f_sdesc': S.of(context).searchGalleryDescription,
      'f_storr': S.of(context).searchTorrentFilenames,
      'f_sto': S.of(context).onlyShowGalleriesWithTorrents,
      'f_sdt1': S.of(context).searchLowPowerTags,
      'f_sdt2': S.of(context).searchDownvotedTags,
      'f_sh': S.of(context).showExpungedGalleries,
    };

    return Drawer(
      child: Container(
        padding: MediaQuery.of(context).viewInsets,
        child: ListView(
          children: <Widget>[
            ListTile(
              title:
                  Text(S.of(context).filter, style: theme.textTheme.headline6),
            ),
            const Divider(),
            _buildSectionTile(title: S.of(context).categories),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (_, index) {
                return _buildCategoryTile(
                  label: _categories.keys.elementAt(index),
                  value: _categories.values.elementAt(index),
                );
              },
              itemCount: _categories.length,
            ),
            const Divider(),
            _buildSectionTile(title: S.of(context).advancedOptions),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (_, index) {
                return _buildAdvancedOptionTile(
                  label: advancedOptions.values.elementAt(index),
                  key: advancedOptions.keys.elementAt(index),
                );
              },
              itemCount: advancedOptions.length,
            ),
            const Divider(),
            Observer(
              builder: (context) {
                return _buildSectionTile(
                  title: S.of(context).minimumRating,
                  trailing: searchStore.minimumRating > 0
                      ? S
                          .of(context)
                          .ratingFilterLabel(searchStore.minimumRating)
                      : null,
                );
              },
            ),
            _buildRatingSlider(),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTile({
    @required String title,
    String trailing,
  }) {
    final theme = Theme.of(context);

    return ListTile(
      title: Text(
        title,
        style: theme.textTheme.bodyText1.copyWith(
          color: theme.textTheme.caption.color,
        ),
      ),
      trailing: trailing != null && trailing.isNotEmpty ? Text(trailing) : null,
    );
  }

  Widget _buildCategoryTile({
    @required String label,
    @required int value,
  }) {
    final searchStore = Provider.of<SearchStore>(context);

    return Observer(
      builder: (context) {
        return CheckboxListTile(
          title: CategoryLabel(
            category: label,
            indicatorSize: 20,
          ),
          value: searchStore.categoryFilter & value == 0,
          onChanged: (bool checked) {
            if (checked) {
              searchStore.setCategoryFilter(searchStore.categoryFilter - value);
            } else {
              searchStore.setCategoryFilter(searchStore.categoryFilter + value);
            }
          },
        );
      },
    );
  }

  Widget _buildAdvancedOptionTile({
    @required String label,
    @required String key,
  }) {
    final searchStore = Provider.of<SearchStore>(context);

    return Observer(
      builder: (context) {
        return CheckboxListTile(
          title: Text(label),
          value: searchStore.advancedOptions[key] ?? false,
          onChanged: (value) {
            searchStore.setAdvancedOption(key: key, value: value);
          },
        );
      },
    );
  }

  Widget _buildRatingSlider() {
    final searchStore = Provider.of<SearchStore>(context);

    return Observer(
      builder: (context) {
        return Slider(
          value: max(searchStore.minimumRating.toDouble(), 1),
          min: 1,
          max: 5,
          divisions: 4,
          label: searchStore.minimumRating > 0
              ? S.of(context).ratingFilterLabel(searchStore.minimumRating)
              : S.of(context).ratingFilterDisabled,
          onChanged: (value) {
            if (value < 2) {
              searchStore.setMinimumRating(0);
            } else {
              searchStore.setMinimumRating(value.floor());
            }
          },
        );
      },
    );
  }
}
