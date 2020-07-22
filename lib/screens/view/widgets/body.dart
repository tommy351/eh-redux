import 'package:eh_redux/generated/l10n.dart';
import 'package:eh_redux/models/gallery.dart';
import 'package:eh_redux/models/image.dart';
import 'package:eh_redux/screens/view/store.dart';
import 'package:eh_redux/stores/image.dart';
import 'package:eh_redux/stores/setting.dart';
import 'package:eh_redux/utils/firebase.dart';
import 'package:eh_redux/utils/key_event.dart';
import 'package:eh_redux/widgets/center_progress_indicator.dart';
import 'package:eh_redux/widgets/stateful_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:photo_view/photo_view.dart';
import 'package:preload_page_view/preload_page_view.dart';
import 'package:provider/provider.dart';

import 'image_provider.dart';

class ViewBody extends StatefulWidget {
  const ViewBody({
    Key key,
    this.initialPage = 0,
  }) : super(key: key);

  final int initialPage;

  @override
  _ViewBodyState createState() => _ViewBodyState();
}

class _ViewBodyState extends State<ViewBody> {
  static const _pageAnimationDuration = Duration(milliseconds: 500);
  static const _pageAnimationCurve = Curves.easeOutCubic;

  PreloadPageController _pageController;
  KeyEventListener _keyEventListener;
  Function _disposeKeyEventListener;

  @override
  void initState() {
    super.initState();
    _pageController = PreloadPageController(
      initialPage: widget.initialPage,
    );
    _keyEventListener = KeyEventListener();
  }

  @override
  void dispose() {
    _setupKeyEventListener(false);
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewStore = Provider.of<ViewStore>(context);
    final settingStore = Provider.of<SettingStore>(context);

    return StatefulWrapper(
      onInit: (context) {
        final disposes = <Function>[
          reaction<int>(
              (_) => viewStore.currentPage, _pageController.jumpToPage),
          autorun((_) => _setupKeyEventListener(
              settingStore.turnPagesWithVolumeKeys.value)),
        ];

        return () {
          for (final dispose in disposes) {
            dispose();
          }
        };
      },
      builder: (context) {
        return Stack(
          children: <Widget>[
            Positioned.fill(
              child: _buildPageView(),
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

  Widget _buildPageView() {
    final gallery = Provider.of<Gallery>(context);
    final viewStore = Provider.of<ViewStore>(context);
    final width = MediaQuery.of(context).size.width;

    return PhotoViewGestureDetectorScope(
      axis: Axis.horizontal,
      child: GestureDetector(
        onTapUp: (details) {
          final dx = details.localPosition.dx;

          if (dx < width / 3) {
            _previousPage();
          } else if (dx > width / 3 * 2) {
            _nextPage();
          } else {
            viewStore.toggleNav();
          }
        },
        child: PreloadPageView.builder(
          itemCount: gallery.fileCount,
          onPageChanged: (value) {
            viewStore.setPage(value);
          },
          controller: _pageController,
          itemBuilder: (context, index) {
            return _buildPhotoView(index + 1);
          },
        ),
      ),
    );
  }

  Widget _buildPhotoView(int imagePage) {
    final imageStore = Provider.of<ImageStore>(context);
    final gallery = Provider.of<Gallery>(context);
    final viewStore = Provider.of<ViewStore>(context);
    final page = GalleryIdWithPage(galleryId: gallery.id, page: imagePage);

    return Observer(
      builder: (context) {
        final options = viewStore.loadOptions[page] ??
            ImageLoadOptions(
              galleryId: gallery.id,
              page: imagePage,
            );

        return PhotoView(
          key: ObjectKey(options),
          loadingBuilder: (_, event) => _buildLoading(event),
          imageProvider: ViewImage(
            imageStore: imageStore,
            options: options,
          ),
          minScale: PhotoViewComputedScale.contained,
          maxScale: PhotoViewComputedScale.covered * 3,
          loadFailedChild: _buildLoadFailedChild(page),
        );
      },
    );
  }

  Widget _buildLoading(ImageChunkEvent event) {
    if (event == null) {
      return const CenterProgressIndicator();
    }

    return CenterProgressIndicator(
      value: event.cumulativeBytesLoaded / event.expectedTotalBytes,
    );
  }

  Widget _buildLoadFailedChild(GalleryIdWithPage page) {
    final viewStore = Provider.of<ViewStore>(context);
    final imageStore = Provider.of<ImageStore>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          Icons.broken_image,
          size: 40,
          color: Colors.white.withOpacity(0.5),
        ),
        const SizedBox(height: 16),
        OutlineButton(
          onPressed: () {
            final image = imageStore.getImageByPage(page);

            analytics.logEvent(name: 'retry_image');

            viewStore.updateLoadOption(ImageLoadOptions(
              galleryId: page.galleryId,
              page: page.page,
              reloadKey: image?.reloadKey,
            ));
          },
          textColor: Colors.white,
          borderSide: BorderSide(color: Colors.white),
          highlightedBorderColor: Colors.white,
          child: Text(S.of(context).retry),
        ),
      ],
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

  void _previousPage() {
    _pageController.previousPage(
        duration: _pageAnimationDuration, curve: _pageAnimationCurve);
  }

  void _nextPage() {
    _pageController.nextPage(
        duration: _pageAnimationDuration, curve: _pageAnimationCurve);
  }

  void _setupKeyEventListener(bool enabled) {
    if (enabled) {
      if (_disposeKeyEventListener != null) return;

      _disposeKeyEventListener = _keyEventListener.listen([
        KeyCode.volumeDown,
        KeyCode.volumeUp,
      ], _handleKeyEvent);
    } else {
      if (_disposeKeyEventListener != null) {
        _disposeKeyEventListener();
        _disposeKeyEventListener = null;
      }
    }
  }

  void _handleKeyEvent(KeyCode code) {
    switch (code) {
      case KeyCode.volumeDown:
        _nextPage();
        break;
      case KeyCode.volumeUp:
        _previousPage();
        break;
    }
  }
}
