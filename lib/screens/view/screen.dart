import 'package:eh_redux/stores/gallery.dart';
import 'package:eh_redux/widgets/center_progress_indicator.dart';
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

    return Provider(
      create: (_) => _viewStore,
      child: MediaQuery(
        data: mediaQuery.copyWith(
          padding: EdgeInsets.zero,
          viewPadding: EdgeInsets.zero,
          viewInsets: EdgeInsets.zero,
        ),
        child: Scaffold(
          backgroundColor: Colors.black,
          appBar: ViewAppBar(
            padding: mediaQuery.viewInsets == EdgeInsets.zero
                ? mediaQuery.padding
                : EdgeInsets.only(top: mediaQuery.padding.top),
          ),
          extendBody: true,
          extendBodyBehindAppBar: true,
          body: const ViewBody(),
          bottomNavigationBar: ViewBottomNavigation(
            padding: mediaQuery.viewInsets == EdgeInsets.zero
                ? mediaQuery.padding.copyWith(top: 0)
                : mediaQuery.viewInsets,
          ),
        ),
      ),
    );
  }
}
