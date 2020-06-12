import 'package:eh_redux/screens/search/store.dart';
import 'package:eh_redux/widgets/gallery_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final searchStore = Provider.of<SearchStore>(context);

    return Observer(
      builder: (context) {
        if (searchStore.paginationKey == null) {
          return Container();
        }

        return GalleryList(paginationKey: searchStore.paginationKey);
      },
    );
  }
}
