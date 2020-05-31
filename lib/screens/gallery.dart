import 'package:cached_network_image/cached_network_image.dart';
import 'package:ehreader/models/gallery.dart';
import 'package:ehreader/screens/view.dart';
import 'package:ehreader/stores/gallery.dart';
import 'package:ehreader/widgets/center_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class GalleryScreenArguments {
  final GalleryId id;

  GalleryScreenArguments({
    @required this.id,
  }) : assert(id != null);
}

class GalleryScreen extends StatelessWidget {
  static String routeName = '/gallery';

  @override
  Widget build(BuildContext context) {
    final GalleryScreenArguments args =
        ModalRoute.of(context).settings.arguments;
    final galleryStore = Provider.of<GalleryStore>(context);

    return Observer(
      builder: (context) {
        final gallery = galleryStore.data[args.id];

        if (gallery == null) {
          return CenterProgressIndicator();
        }

        return Scaffold(
          appBar: AppBar(
            title: Text(gallery.title ?? ''),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CachedNetworkImage(imageUrl: gallery.thumbnail),
              Text(gallery.category),
              Text(gallery.title),
              Text(gallery.titleJpn),
              Text('File count: ${gallery.fileCount}'),
              Text('Rating: ${gallery.rating}'),
              Text('Tags: ${gallery.tags.join((', '))}'),
              Text('Uploader: ${gallery.uploader}'),
              Text('Posted: ${gallery.posted.toIso8601String()}'),
            ],
          ),
          floatingActionButton: FloatingActionButton.extended(
            icon: Icon(Icons.chevron_right),
            label: Text('Read'),
            backgroundColor: Colors.pinkAccent,
            onPressed: () {
              Navigator.pushNamed(
                context,
                ViewScreen.routeName,
                arguments: ViewScreenArguments(id: gallery.id),
              );
            },
          ),
        );
      },
    );
  }
}
