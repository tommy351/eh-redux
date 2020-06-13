import 'package:eh_redux/models/category_colors.dart';
import 'package:eh_redux/screens/search/store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class SearchFilter extends StatefulWidget {
  const SearchFilter({Key key}) : super(key: key);

  @override
  _SearchFilterState createState() => _SearchFilterState();
}

class _SearchFilterState extends State<SearchFilter> {
  static const _categoryIndicatorSize = 20.0;
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
  static const _advancedOptions = <String, String>{
    'f_sname': 'Search Gallery Name',
    'f_stags': 'Search Gallery Tags',
    'f_sdesc': 'Search Gallery Description',
    'f_storr': 'Search Torrent Filenames',
    'f_sto': 'Only Show Galleries With Torrents',
    'f_sdt1': 'Search Low-Power Tags',
    'f_sdt2': 'Search Downvoted Tags',
    'f_sh': 'Show Expunged Galleries',
  };
  static const _ratingOptions = <int, String>{
    0: 'No Filter',
    2: '2 stars',
    3: '3 stars',
    4: '4 stars',
    5: '5 stars',
  };

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Drawer(
      child: Container(
        padding: MediaQuery.of(context).viewInsets,
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text('Filter', style: theme.textTheme.headline6),
            ),
            const Divider(),
            _buildSectionTile('Categories'),
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
            _buildSectionTile('Advanced Options'),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (_, index) {
                return _buildAdvancedOptionTile(
                  label: _advancedOptions.values.elementAt(index),
                  key: _advancedOptions.keys.elementAt(index),
                );
              },
              itemCount: _advancedOptions.length,
            ),
            const Divider(),
            _buildSectionTile('Minimum Rating'),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (_, index) {
                return _buildRatingTile(
                  value: _ratingOptions.keys.elementAt(index),
                  label: _ratingOptions.values.elementAt(index),
                );
              },
              itemCount: _ratingOptions.length,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTile(String title) {
    final theme = Theme.of(context);

    return ListTile(
      title: Text(title,
          style: theme.textTheme.bodyText1.copyWith(
            color: theme.textTheme.caption.color,
          )),
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
          title: Row(
            children: <Widget>[
              Container(
                width: _categoryIndicatorSize,
                height: _categoryIndicatorSize,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: categoryColors[label] ?? categoryColors[''],
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(label),
              ),
            ],
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

  Widget _buildRatingTile({@required int value, @required String label}) {
    final searchStore = Provider.of<SearchStore>(context);

    return Observer(
      builder: (context) {
        return RadioListTile<int>(
          title: Text(label),
          value: value,
          groupValue: searchStore.minimumRating,
          onChanged: searchStore.setMinimumRating,
        );
      },
    );
  }
}
