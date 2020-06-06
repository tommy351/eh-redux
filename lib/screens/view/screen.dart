import 'package:ehreader/models/gallery.dart';
import 'package:ehreader/repositories/ehentai_client.dart';
import 'package:ehreader/stores/gallery.dart';
import 'package:ehreader/stores/image.dart';
import 'package:ehreader/widgets/center_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';

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
    final client = Provider.of<EHentaiClient>(context);
    final gallery = Provider.of<Gallery>(context);
    final imageStore = Provider.of<ImageStore>(context);

    return Provider.value(
      value: _viewStore,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black.withOpacity(0.5),
          title: Observer(
            builder: (context) =>
                Text('${_viewStore.currentPage + 1} / ${gallery.fileCount}'),
          ),
          actions: <Widget>[
            Observer(
              builder: (context) {
                final page = GalleryIdWithPage((b) => b
                  ..galleryId = gallery.id.toBuilder()
                  ..page = _viewStore.currentPage + 1);
                final image = imageStore.data[imageStore.index[page]];

                if (image == null) {
                  return Container();
                }

                return IconButton(
                  icon: Icon(Icons.share),
                  tooltip: 'Share',
                  onPressed: () {
                    Share.share(
                      client.getImageUrl(image.id),
                      subject: gallery.title,
                    );
                  },
                );
              },
            )
          ],
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
