import 'package:eh_redux/generated/l10n.dart';
import 'package:eh_redux/modules/common/widgets/stateful_wrapper.dart';
import 'package:eh_redux/modules/gallery/stores/network_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:provider/provider.dart';

import 'list.dart';

part 'network_list.g.dart';

class NetworkGalleryList extends StatefulWidget {
  const NetworkGalleryList({Key key}) : super(key: key);

  @override
  _NetworkGalleryListState createState() => _NetworkGalleryListState();
}

class _NetworkGalleryListState extends State<NetworkGalleryList> {
  @override
  void initState() {
    super.initState();

    Provider.of<NetworkGalleryListStore>(context, listen: false)
        .loadInitialPage();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    Provider.of<NetworkGalleryListStore>(context, listen: false)
        .loadInitialPage();
  }

  @override
  Widget build(BuildContext context) {
    final listStore = Provider.of<NetworkGalleryListStore>(context);

    return Observer(
      builder: (context) {
        if (listStore.currentPage < 0) {
          return const Center(child: CircularProgressIndicator());
        }

        return RefreshIndicator(
          onRefresh: () => listStore.refreshPage(),
          child: listStore.data.isEmpty
              ? const _Placeholder()
              : GalleryList(
                  data: listStore.data.values,
                  footer: listStore.hasMore ? const _Footer() : null,
                ),
        );
      },
    );
  }
}

@swidget
Widget _placeholder(BuildContext context) {
  final theme = Theme.of(context);

  return LayoutBuilder(
    builder: (context, constraints) {
      return SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: constraints.maxHeight,
          ),
          child: Center(
            child: Text(
              S.of(context).galleryListNoDataPlaceholderTitle,
              style: theme.textTheme.headline6,
            ),
          ),
        ),
      );
    },
  );
}

@swidget
Widget _footer(BuildContext context) {
  final listStore = Provider.of<NetworkGalleryListStore>(context);

  return StatefulWrapper(
    onInit: (context) {
      listStore.loadNextPage();
      return () {};
    },
    builder: (context) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: CircularProgressIndicator(),
        ),
      );
    },
  );
}
