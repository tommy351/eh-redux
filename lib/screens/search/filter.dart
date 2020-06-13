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
  static const _categoryIndicatorSize = 16.0;
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
            ListTile(
              title: Text('Categories',
                  style: theme.textTheme.bodyText1.copyWith(
                    color: theme.textTheme.caption.color,
                  )),
            ),
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
          ],
        ),
      ),
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
              const SizedBox(width: 6),
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
}
