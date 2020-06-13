import 'package:eh_redux/screens/search/args.dart';
import 'package:eh_redux/screens/search/body.dart';
import 'package:eh_redux/screens/search/store.dart';
import 'package:eh_redux/screens/search/text_field.dart';
import 'package:eh_redux/stores/gallery.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  static String routeName = '/search';

  const SearchScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context).settings.arguments as SearchScreenArguments;
    final galleryStore = Provider.of<GalleryStore>(context);

    return Provider(
      create: (_) {
        final searchStore = SearchStore(galleryStore: galleryStore);

        if (args.query != null && args.query.isNotEmpty) {
          searchStore.setQuery(args.query);
          searchStore.updatePaginationKey();
        }

        return searchStore;
      },
      child: _SearchScreenContent(),
    );
  }
}

class _SearchScreenContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final searchStore = Provider.of<SearchStore>(context);

    return GestureDetector(
      onTap: () {
        final currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          title: const SearchTextField(),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.filter_list),
              tooltip: 'Filter',
              onPressed: () {
                //
              },
            ),
            IconButton(
              icon: const Icon(Icons.search),
              tooltip: 'Search',
              onPressed: () {
                searchStore.updatePaginationKey();
                FocusScope.of(context).unfocus();
              },
            )
          ],
        ),
        body: const SearchBody(),
      ),
    );
  }
}
