import 'dart:io';

import 'package:eh_redux/generated/l10n.dart';
import 'package:eh_redux/modules/common/widgets/stateful_wrapper.dart';
import 'package:eh_redux/modules/image/store.dart';
import 'package:eh_redux/modules/image/types.dart';
import 'package:eh_redux/utils/firebase.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:mobx/mobx.dart';
import 'package:photo_view/photo_view.dart';
import 'package:preload_page_view/preload_page_view.dart';
import 'package:provider/provider.dart';

import 'key_event_detector.dart';
import 'tap_event_detector.dart';

part 'body.g.dart';

class ImageBody extends StatefulWidget {
  const ImageBody({Key key}) : super(key: key);

  @override
  _ImageBodyState createState() => _ImageBodyState();
}

class _ImageBodyState extends State<ImageBody> {
  static const _duration = Duration(milliseconds: 500);
  static const _curve = Curves.easeOutCubic;

  PreloadPageController _controller;
  ReactionDisposer _dispose;

  @override
  void initState() {
    super.initState();
    final store = Provider.of<ImageStore>(context, listen: false);
    _controller = PreloadPageController(initialPage: store.currentPage);
    _dispose = reaction<int>((_) => store.currentPage, (page) {
      _controller.jumpToPage(page);
    });
  }

  @override
  void dispose() {
    _dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<ImageStore>(context);

    return TapEventDetector(
      onPrevious: _previousPage,
      onNext: _nextPage,
      child: KeyEventDetector(
        onPrevious: _previousPage,
        onNext: _nextPage,
        child: Stack(
          children: [
            Positioned.fill(
              child: PhotoViewGestureDetectorScope(
                child: PreloadPageView.builder(
                  itemCount: store.totalPage,
                  controller: _controller,
                  onPageChanged: (page) {
                    store.setCurrentPage(page);
                  },
                  itemBuilder: (context, index) {
                    return _ImageView(page: index + 1);
                  },
                ),
              ),
            ),
            const Positioned(
              bottom: 0,
              right: 0,
              child: _StatusBar(),
            ),
          ],
        ),
      ),
    );
  }

  void _previousPage() {
    _controller.previousPage(duration: _duration, curve: _curve);
  }

  void _nextPage() {
    _controller.nextPage(duration: _duration, curve: _curve);
  }
}

@swidget
Widget _statusBar(BuildContext context) {
  final store = Provider.of<ImageStore>(context);
  final theme = Theme.of(context);

  return Container(
    padding: const EdgeInsets.all(8),
    decoration: BoxDecoration(
      color: Colors.black.withOpacity(0.5),
      borderRadius: const BorderRadius.only(topLeft: Radius.circular(8)),
    ),
    child: Observer(
      builder: (context) {
        return Text(
          '${store.currentPage1} / ${store.totalPage}',
          style: theme.textTheme.bodyText2.copyWith(color: Colors.white),
        );
      },
    ),
  );
}

@swidget
Widget _imageLoading(
  BuildContext context, {
  ImageChunkEvent event,
}) {
  return Center(
    child: CircularProgressIndicator(
      value: event != null
          ? event.cumulativeBytesLoaded / event.expectedTotalBytes
          : null,
    ),
  );
}

@swidget
Widget _imageView(BuildContext context, {@required int page}) {
  final store = Provider.of<ImageStore>(context);

  return StatefulWrapper(
    onInit: (context) {
      store.loadPage(page);
      return () {};
    },
    builder: (context) {
      return Observer(
        builder: (context) {
          if (store.loading.contains(page)) {
            return const _ImageLoading();
          }

          final image = store.data[page];

          if (image == null) {
            return const _ImageLoading();
          }

          return PhotoView(
            loadingBuilder: (_, event) => _ImageLoading(event: event),
            errorBuilder: (context, err, stackTrace) {
              FirebaseCrashlytics.instance.recordError(err, stackTrace);

              return _ImageError(
                image: image,
                error: err,
              );
            },
            minScale: PhotoViewComputedScale.contained,
            maxScale: PhotoViewComputedScale.covered * 3,
            imageProvider: image.map(
              network: (image) => NetworkImage(image.url),
              local: (image) => FileImage(File(image.path)),
            ),
          );
        },
      );
    },
  );
}

@swidget
Widget _imageError(
  BuildContext context, {
  GalleryImage image,
  Object error,
}) {
  final store = Provider.of<ImageStore>(context);

  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(
        Icons.broken_image,
        size: 40,
        color: Colors.white.withOpacity(0.5),
      ),
      Text(error?.toString() ?? S.of(context).imageErrorTitle),
      const SizedBox(height: 16),
      OutlineButton(
        onPressed: () async {
          analytics.logEvent(name: 'retry_image');
          await store.loadPage(
            image.id.page,
            networkOnly: true,
            reloadKey: image.maybeMap(
              network: (image) => image.reloadKey,
              orElse: null,
            ),
          );
        },
        textColor: Colors.white,
        borderSide: const BorderSide(color: Colors.white),
        highlightedBorderColor: Colors.white,
        child: Text(S.of(context).retryButtonLabel),
      ),
    ],
  );
}
