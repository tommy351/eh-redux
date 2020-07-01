import 'package:eh_redux/generated/l10n.dart';
import 'package:eh_redux/screens/search/store.dart';
import 'package:eh_redux/widgets/gallery_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'text_field.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final searchStore = Provider.of<SearchStore>(context);
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final iconTheme =
        isDark ? theme.iconTheme : const IconThemeData(color: Colors.black);

    return NestedScrollView(
      headerSliverBuilder: (context, _) => [
        SliverAppBar(
          backgroundColor: isDark ? theme.appBarTheme.color : Colors.white,
          iconTheme: iconTheme,
          pinned: true,
          forceElevated: true,
          title: const SearchTextField(),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.filter_list),
              tooltip: S.of(context).filter,
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
            ),
          ],
        ),
      ],
      body: SafeArea(
        top: false,
        child: Observer(
          builder: (context) {
            if (searchStore.paginationKey == null) {
              return Container();
            }

            return GalleryList(paginationKey: searchStore.paginationKey);
          },
        ),
      ),
    );
  }
}
