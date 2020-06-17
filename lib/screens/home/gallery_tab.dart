import 'package:eh_redux/generated/l10n.dart';
import 'package:eh_redux/models/gallery.dart';
import 'package:eh_redux/screens/search/args.dart';
import 'package:eh_redux/screens/search/screen.dart';
import 'package:eh_redux/widgets/gallery_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GalleryTab extends StatelessWidget {
  const GalleryTab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, _) => [
        SliverAppBar(
          title: Text(S.of(context).gallery),
          pinned: true,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.search),
              tooltip: S.of(context).search,
              onPressed: () {
                Navigator.pushNamed(context, SearchScreen.routeName,
                    arguments: SearchScreenArguments());
              },
            )
          ],
        ),
      ],
      body: const SafeArea(
        top: false,
        bottom: false,
        child: GalleryList(
          paginationKey: GalleryPaginationKeyFrontPage(),
        ),
      ),
    );
  }
}
