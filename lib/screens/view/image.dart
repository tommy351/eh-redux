import 'package:eh_redux/models/gallery.dart';
import 'package:eh_redux/stores/image.dart';
import 'package:eh_redux/widgets/center_progress_indicator.dart';
import 'package:eh_redux/widgets/stateful_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:photo_view/photo_view.dart';
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

            return PhotoView(
              imageProvider: NetworkImage(image.url),
              minScale: PhotoViewComputedScale.contained,
              maxScale: PhotoViewComputedScale.covered * 3,
              loadingBuilder: (context, event) {
                return CenterProgressIndicator(
                  value: event == null
                      ? 0
                      : event.cumulativeBytesLoaded / event.expectedTotalBytes,
                );
              },
            );
          },
        );
      },
    );
  }
}
