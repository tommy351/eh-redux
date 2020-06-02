import 'package:cached_network_image/cached_network_image.dart';
import 'package:ehreader/models/gallery.dart';
import 'package:ehreader/stores/image.dart';
import 'package:ehreader/widgets/center_progress_indicator.dart';
import 'package:ehreader/widgets/stateful_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class ViewImage extends StatelessWidget {
  final int imagePage;

  const ViewImage({
    Key key,
    @required this.imagePage,
  })  : assert(imagePage != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final gallery = Provider.of<Gallery>(context);
    final imageStore = Provider.of<ImageStore>(context);
    final page = GalleryIdWithPage((b) => b
      ..galleryId = gallery.id.toBuilder()
      ..page = imagePage);

    return StatefulWrapper(
      onInit: (context) {
        imageStore.loadImage(gallery.id, imagePage);
        return () {};
      },
      builder: (context) {
        return Observer(
          builder: (context) {
            final image = imageStore.data[imageStore.index[page]];

            if (image == null) {
              return const CenterProgressIndicator();
            }

            return CachedNetworkImage(
              imageUrl: image.url,
              progressIndicatorBuilder: (context, _, downloadProgress) {
                return CenterProgressIndicator(
                  value: downloadProgress.progress,
                );
              },
            );
          },
        );
      },
    );
  }
}
