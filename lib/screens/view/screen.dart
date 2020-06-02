import 'package:cached_network_image/cached_network_image.dart';
import 'package:ehreader/models/gallery.dart';
import 'package:ehreader/screens/view/args.dart';
import 'package:ehreader/stores/gallery.dart';
import 'package:ehreader/stores/image.dart';
import 'package:ehreader/widgets/center_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class ViewScreen extends StatelessWidget {
  static String routeName = '/view';

  const ViewScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context).settings.arguments as ViewScreenArguments;
    final galleryStore = Provider.of<GalleryStore>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('View'),
      ),
      body: Observer(
        builder: (context) {
          final gallery = galleryStore.data[args.id];

          if (gallery == null) {
            return const CenterProgressIndicator();
          }

          return _ViewScreenContent(gallery: gallery);
        },
      ),
    );
  }
}

class _ViewScreenContent extends StatefulWidget {
  final Gallery gallery;

  const _ViewScreenContent({
    @required this.gallery,
  }) : assert(gallery != null);

  @override
  _ViewScreenContentState createState() =>
      _ViewScreenContentState(gallery: gallery);
}

class _ViewScreenContentState extends State<_ViewScreenContent> {
  final Gallery gallery;

  _ViewScreenContentState({
    @required this.gallery,
  }) : assert(gallery != null);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemBuilder: (context, i) {
        return _ViewImage(
          gallery: gallery,
          imagePage: i + 1,
        );
      },
      itemCount: gallery.fileCount,
    );
  }
}

class _ViewImage extends StatelessWidget {
  final Gallery gallery;
  final int imagePage;

  const _ViewImage({
    Key key,
    @required this.gallery,
    @required this.imagePage,
  })  : assert(gallery != null),
        assert(imagePage != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return _ViewImageContent(
      galleryId: gallery.id,
      imageStore: Provider.of<ImageStore>(context),
      imagePage: imagePage,
    );
  }
}

class _ViewImageContent extends StatefulWidget {
  final GalleryId galleryId;
  final ImageStore imageStore;
  final int imagePage;

  const _ViewImageContent({
    Key key,
    @required this.galleryId,
    @required this.imageStore,
    @required this.imagePage,
  })  : assert(galleryId != null),
        assert(imageStore != null),
        assert(imagePage != null),
        super(key: key);

  @override
  _ViewImageContentState createState() => _ViewImageContentState(
        galleryId: galleryId,
        imageStore: imageStore,
        imagePage: imagePage,
      );
}

class _ViewImageContentState extends State<_ViewImageContent> {
  final GalleryId galleryId;
  final ImageStore imageStore;
  final int imagePage;

  _ViewImageContentState({
    @required this.galleryId,
    @required this.imageStore,
    @required this.imagePage,
  })  : assert(galleryId != null),
        assert(imageStore != null),
        assert(imagePage != null);

  @override
  void initState() {
    super.initState();
    imageStore.loadImage(galleryId, imagePage);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        final page = GalleryIdWithPage((b) => b
          ..galleryId = galleryId.toBuilder()
          ..page = imagePage);
        final image = imageStore.data[imageStore.index[page]];

        if (image == null) {
          return const CenterProgressIndicator();
        }

        return CachedNetworkImage(
          imageUrl: image.url,
          progressIndicatorBuilder: (context, _, downloadProgress) => Center(
            child: CircularProgressIndicator(
              value: downloadProgress.progress,
            ),
          ),
        );
      },
    );
  }
}
