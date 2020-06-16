import 'package:eh_redux/models/gallery.dart';
import 'package:eh_redux/screens/gallery/rating.dart';
import 'package:eh_redux/screens/gallery/tag_list.dart';
import 'package:eh_redux/stores/gallery.dart';
import 'package:eh_redux/widgets/center_progress_indicator.dart';
import 'package:eh_redux/widgets/stateful_wrapper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'app_bar.dart';
import 'args.dart';
import 'header.dart';
import 'info.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({Key key}) : super(key: key);

  static String routeName = '/gallery';

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context).settings.arguments as GalleryScreenArguments;
    final galleryStore = Provider.of<GalleryStore>(context);

    return StatefulWrapper(
      onInit: (context) {
        galleryStore.loadGalleryDetails(args.id);
        return () => {};
      },
      builder: (context) {
        return Observer(builder: (context) {
          return MultiProvider(
            providers: [
              Provider.value(value: galleryStore.data[args.id]),
              Provider.value(value: galleryStore.details[args.id]),
            ],
            child: const _GalleryScreenContent(),
          );
        });
      },
    );
  }
}

class _GalleryScreenContent extends StatelessWidget {
  const _GalleryScreenContent({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final gallery = Provider.of<Gallery>(context);

    if (gallery == null) {
      return const CenterProgressIndicator();
    }

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const GalleryAppBar(),
          const GalleryHeader(),
          _buildDivider(),
          const GalleryRating(),
          _buildDivider(),
          const GalleryInfo(),
          _buildDivider(),
          const GalleryTagList(),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return const SliverToBoxAdapter(
      child: Divider(),
    );
  }
}
