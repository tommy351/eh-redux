import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:preload_page_view/preload_page_view.dart';

class PreloadPhotoViewGallery extends StatelessWidget {
  const PreloadPhotoViewGallery({
    Key key,
    this.reverse = false,
    this.controller,
    this.onPageChanged,
    @required this.itemBuilder,
    @required this.itemCount,
    this.scrollDirection = Axis.horizontal,
    this.loadingBuilder,
    this.scrollPhysics,
  })  : assert(itemBuilder != null),
        assert(itemCount != null),
        assert(itemCount >= 0),
        super(key: key);

  final bool reverse;
  final PreloadPageController controller;
  final Function(int) onPageChanged;
  final PhotoViewGalleryPageOptions Function(BuildContext, int) itemBuilder;
  final int itemCount;
  final Axis scrollDirection;
  final Widget Function(BuildContext, ImageChunkEvent) loadingBuilder;
  final ScrollPhysics scrollPhysics;

  @override
  Widget build(BuildContext context) {
    return PhotoViewGestureDetectorScope(
      axis: scrollDirection,
      child: PreloadPageView.builder(
        reverse: reverse,
        controller: controller,
        scrollDirection: scrollDirection,
        itemCount: itemCount,
        onPageChanged: onPageChanged,
        physics: scrollPhysics,
        itemBuilder: (context, index) {
          final option = itemBuilder(context, index);

          return PhotoView(
            key: ObjectKey(index),
            imageProvider: option.imageProvider,
            loadingBuilder: loadingBuilder,
            controller: option.controller,
            scaleStateController: option.scaleStateController,
            heroAttributes: option.heroAttributes,
            initialScale: option.initialScale,
            minScale: option.minScale,
            maxScale: option.maxScale,
            scaleStateCycle: option.scaleStateCycle,
            onTapUp: option.onTapUp,
            onTapDown: option.onTapDown,
            gestureDetectorBehavior: option.gestureDetectorBehavior,
            tightMode: option.tightMode,
            filterQuality: option.filterQuality,
            basePosition: option.basePosition,
          );
        },
      ),
    );
  }
}
