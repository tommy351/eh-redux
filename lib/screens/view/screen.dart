import 'package:ehreader/models/gallery.dart';
import 'package:ehreader/stores/gallery.dart';
import 'package:ehreader/widgets/center_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'args.dart';
import 'body.dart';
import 'bottom_nav.dart';
import 'store.dart';

class ViewScreen extends StatelessWidget {
  static String routeName = '/view';

  const ViewScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context).settings.arguments as ViewScreenArguments;
    final galleryStore = Provider.of<GalleryStore>(context);

    return Observer(
      builder: (context) {
        final gallery = galleryStore.data[args.id];

        if (gallery == null) {
          return const CenterProgressIndicator();
        }

        return Provider.value(
          value: gallery,
          child: _ViewScreenContent(),
        );
      },
    );
  }
}

class _ViewScreenContent extends StatefulWidget {
  @override
  _ViewScreenContentState createState() => _ViewScreenContentState();
}

class _ViewScreenContentState extends State<_ViewScreenContent> {
  final _viewStore = ViewStore();

  @override
  Widget build(BuildContext context) {
    final gallery = Provider.of<Gallery>(context);

    return Provider.value(
      value: _viewStore,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black.withOpacity(0.5),
          title: Observer(
              builder: (context) =>
                  Text('${_viewStore.currentPage + 1} / ${gallery.fileCount}')),
          elevation: 0,
        ),
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: const ViewBody(),
        bottomNavigationBar: const ViewBottomNavigation(),
      ),
    );
  }
}
