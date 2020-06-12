import 'package:eh_redux/screens/search/store.dart';
import 'package:eh_redux/screens/search/text_field.dart';
import 'package:eh_redux/stores/gallery.dart';
import 'package:eh_redux/widgets/gallery_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  static String routeName = '/search';

  const SearchScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final galleryStore = Provider.of<GalleryStore>(context);

    return Provider(
      create: (_) => SearchStore(galleryStore: galleryStore),
      child: _SearchScreenContent(),
    );
  }
}

class _SearchScreenContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final searchStore = Provider.of<SearchStore>(context);

    return Scaffold(
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
            },
          )
        ],
      ),
      body: Observer(
        builder: (context) {
          if (searchStore.paginationKey == null) {
            return Container();
          }

          return GalleryList(paginationKey: searchStore.paginationKey);
        },
      ),
    );
  }
}
