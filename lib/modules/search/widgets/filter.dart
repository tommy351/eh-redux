import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:eh_redux/modules/search/store.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

import 'category_bottom_sheet.dart';
import 'filter_bottom_sheet.dart';
import 'rating_bottom_sheet.dart';

class SearchFilter extends StatelessWidget with PreferredSizeWidget {
  const SearchFilter({Key key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(48);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<SearchStore>(context);
    final theme = Theme.of(context);

    return TextButtonTheme(
      data: TextButtonThemeData(
        style: TextButton.styleFrom(
          primary: theme.textTheme.bodyText1.color,
        ),
      ),
      child: Row(
        children: [
          const SizedBox(width: 8),
          TextButton.icon(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return CategoryBottomSheet(store: store);
                },
              ).whenComplete(() => store.updateParams());
            },
            icon: const Icon(Icons.category),
            label: Text(AppLocalizations.of(context).searchCategoryButtonLabel),
          ),
          TextButton.icon(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) {
                  return RatingBottomSheet(store: store);
                },
              ).whenComplete(() => store.updateParams());
            },
            icon: const Icon(Icons.star),
            label: Text(AppLocalizations.of(context).searchRatingButtonLabel),
          ),
          const Spacer(),
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return FilterBottomSheet(store: store);
                },
              ).whenComplete(() => store.updateParams());
            },
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
    );
  }
}
