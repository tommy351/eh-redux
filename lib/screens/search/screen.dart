import 'package:eh_redux/screens/search/args.dart';
import 'package:eh_redux/screens/search/body.dart';
import 'package:eh_redux/screens/search/filter.dart';
import 'package:eh_redux/screens/search/store.dart';
import 'package:eh_redux/stores/gallery.dart';
import 'package:eh_redux/widgets/stateful_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key key}) : super(key: key);

  static String routeName = '/search';

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
      child: const _SearchScreenContent(),
    );
  }
}

class _SearchScreenContent extends StatefulWidget {
  const _SearchScreenContent({Key key}) : super(key: key);

  @override
  __SearchScreenContentState createState() => __SearchScreenContentState();
}

class __SearchScreenContentState extends State<_SearchScreenContent> {
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
        body: const SearchBody(),
        endDrawer: StatefulWrapper(
          onDispose: () {
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              searchStore.updatePaginationKey();
            });
          },
          builder: (_) => const SearchFilter(),
        ),
      ),
    );
  }
}
