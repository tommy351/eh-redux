import 'package:eh_redux/models/gallery.dart';
import 'package:eh_redux/stores/image.dart';
import 'package:eh_redux/utils/firebase.dart';
import 'package:eh_redux/widgets/center_progress_indicator.dart';
import 'package:eh_redux/widgets/stateful_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:preload_page_view/preload_page_view.dart';
import 'package:provider/provider.dart';

import 'gallery.dart';
import 'image_provider.dart';
import 'store.dart';

class ViewBody extends StatefulWidget {
  const ViewBody({Key key}) : super(key: key);

  @override
  _ViewBodyState createState() => _ViewBodyState();
}

class _ViewBodyState extends State<ViewBody> {
  PreloadPageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PreloadPageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final gallery = Provider.of<Gallery>(context);
    final viewStore = Provider.of<ViewStore>(context);
    final imageStore = Provider.of<ImageStore>(context);
    final width = MediaQuery.of(context).size.width;

    return StatefulWrapper(
      onInit: (context) {
        return reaction((_) => viewStore.currentPage, (int page) {
          _pageController.jumpToPage(page);
        });
      },
      builder: (context) {
        return Stack(
          children: <Widget>[
            Positioned.fill(
              child: GestureDetector(
                onTapUp: (details) {
                  final dx = details.localPosition.dx;
                  const duration = Duration(milliseconds: 500);
                  const curve = Curves.easeOutCubic;

                  if (dx < width / 3) {
                    _pageController.previousPage(
                        duration: duration, curve: curve);
                  } else if (dx > width / 3 * 2) {
                    _pageController.nextPage(duration: duration, curve: curve);
                  } else {
                    viewStore.toggleNav();
                  }
                },
                child: PreloadPhotoViewGallery(
                  controller: _pageController,
                  onPageChanged: (value) {
                    viewStore.setPage(value);
                    analytics.logEvent(name: 'update_view_page');
                  },
                  itemCount: gallery.fileCount,
                  loadingBuilder: (context, event) {
                    if (event == null) {
                      return const CenterProgressIndicator();
                    }

                    return CenterProgressIndicator(
                      value: event.cumulativeBytesLoaded /
                          event.expectedTotalBytes,
                    );
                  },
                  itemBuilder: (context, index) {
                    return PhotoViewGalleryPageOptions(
                      minScale: PhotoViewComputedScale.contained,
                      maxScale: PhotoViewComputedScale.covered * 3,
                      imageProvider: ViewImage(
                        imageStore: imageStore,
                        page: GalleryIdWithPage(
                          galleryId: gallery.id,
                          page: index + 1,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: _buildStatus(),
            ),
          ],
        );
      },
    );
  }

  Widget _buildStatus() {
    final theme = Theme.of(context);
    final viewStore = Provider.of<ViewStore>(context);
    final gallery = Provider.of<Gallery>(context);

    return Observer(
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.5),
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(8)),
          ),
          child: Text(
            '${viewStore.currentPage + 1} / ${gallery.fileCount}',
            style: theme.textTheme.bodyText2.copyWith(color: Colors.white),
          ),
        );
      },
    );
  }
}
