import 'package:ehreader/stores/gallery.dart';
import 'package:ehreader/widgets/center_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'app_bar.dart';
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
    final mediaQuery = MediaQuery.of(context);
    final paddingBottom = mediaQuery.padding.bottom;
    final padding = mediaQuery.padding.copyWith(bottom: 0);

    return Provider.value(
      value: _viewStore,
      child: MediaQuery(
        data: mediaQuery.copyWith(
          padding: padding,
          viewPadding: padding,
          viewInsets: padding,
        ),
        child: Scaffold(
          backgroundColor: Colors.black,
          appBar: const ViewAppBar(),
          extendBody: true,
          extendBodyBehindAppBar: true,
          body: const ViewBody(),
          bottomNavigationBar: ViewBottomNavigation(
            padding: EdgeInsets.only(
              bottom: paddingBottom,
            ),
          ),
        ),
      ),
    );
  }
}
