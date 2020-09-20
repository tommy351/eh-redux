import 'package:eh_redux/database/database.dart';
import 'package:eh_redux/modules/gallery/stores/network_list.dart';
import 'package:eh_redux/modules/gallery/widgets/network_list.dart';
import 'package:eh_redux/modules/home/widgets/body.dart';
import 'package:eh_redux/modules/search/store.dart';
import 'package:eh_redux/modules/search/types.dart';
import 'package:eh_redux/services/ehentai.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:provider/provider.dart';

import 'filter.dart';
import 'text_field.dart';

part 'screen.g.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({
    Key key,
    this.arguments = const SearchArguments(),
  })  : assert(arguments != null),
        super(key: key);

  static const route = '/search';

  final SearchArguments arguments;

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  SearchStore _store;

  @override
  void initState() {
    super.initState();

    final database = Provider.of<Database>(context, listen: false);
    _store = SearchStore(
      searchHistoriesDao: database.searchHistoriesDao,
    )..setQuery(widget.arguments.query);
  }

  @override
  Widget build(BuildContext context) {
    return Provider.value(
      value: _store,
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          body: NestedScrollView(
            headerSliverBuilder: (context, _) => const [_AppBar()],
            body: const _Body(),
          ),
        ),
      ),
    );
  }
}

@swidget
Widget _appBar(BuildContext context) {
  final theme = Theme.of(context);
  final isDark = theme.brightness == Brightness.dark;
  final iconTheme =
      isDark ? theme.iconTheme : const IconThemeData(color: Colors.black);

  return SliverAppBar(
    backgroundColor: isDark ? theme.appBarTheme.color : Colors.white,
    iconTheme: iconTheme,
    pinned: true,
    title: const SearchTextField(),
    bottom: const SearchFilter(),
  );
}

@swidget
Widget _body(BuildContext context) {
  final client = Provider.of<EHentaiClient>(context);
  final store = Provider.of<SearchStore>(context);

  return Observer(
    builder: (context) {
      if (store.query.isEmpty) {
        return Container();
      }

      return ProxyProvider0(
        update: (_, __) => NetworkGalleryListStore(
          client: client,
          params: store.params,
        ),
        child: const HomeBody(
          child: NetworkGalleryList(),
        ),
      );
    },
  );
}
