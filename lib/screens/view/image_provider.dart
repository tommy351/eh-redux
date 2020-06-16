import 'dart:async';
import 'dart:io';
import 'dart:ui' as ui;

import 'package:eh_redux/models/gallery.dart';
import 'package:eh_redux/stores/image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ViewImage extends ImageProvider<ViewImage> {
  ViewImage({
    @required this.page,
    @required this.imageStore,
    this.scale = 1.0,
  })  : assert(page != null),
        assert(imageStore != null);

  static final _httpClient = HttpClient()..autoUncompress = false;

  final GalleryIdWithPage page;
  final double scale;
  final ImageStore imageStore;

  @override
  Future<ViewImage> obtainKey(ImageConfiguration configuration) {
    return SynchronousFuture<ViewImage>(this);
  }

  @override
  ImageStreamCompleter load(ViewImage key, DecoderCallback decode) {
    final StreamController<ImageChunkEvent> chunkEvents =
        StreamController<ImageChunkEvent>();

    return MultiFrameImageStreamCompleter(
      codec: _loadAsync(key, chunkEvents, decode),
      chunkEvents: chunkEvents.stream,
      scale: key.scale,
      informationCollector: () {
        return <DiagnosticsNode>[
          DiagnosticsProperty<ImageProvider>('Image provider', this),
          DiagnosticsProperty<ViewImage>('Image key', key),
        ];
      },
    );
  }

  Future<ui.Codec> _loadAsync(
    ViewImage key,
    StreamController<ImageChunkEvent> chunkEvents,
    DecoderCallback decode,
  ) async {
    try {
      assert(key == this);

      await imageStore.loadImage(page.galleryId, page.page);

      final image = imageStore.data[imageStore.index[page]];
      final url = Uri.base.resolve(image.url);
      final request = await _httpClient.getUrl(url);
      final response = await request.close();

      if (response.statusCode != HttpStatus.ok) {
        PaintingBinding.instance.imageCache.evict(key);
        throw NetworkImageLoadException(
            statusCode: response.statusCode, uri: url);
      }

      final bytes = await consolidateHttpClientResponseBytes(
        response,
        onBytesReceived: (cumulative, total) {
          chunkEvents.add(ImageChunkEvent(
            cumulativeBytesLoaded: cumulative,
            expectedTotalBytes: total,
          ));
        },
      );

      if (bytes.lengthInBytes == 0) {
        throw Exception('ViewImage is an empty file: $url');
      }

      return decode(bytes);
    } finally {
      chunkEvents.close();
    }
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ViewImage &&
          runtimeType == other.runtimeType &&
          page == other.page &&
          scale == other.scale &&
          imageStore == other.imageStore;

  @override
  int get hashCode => page.hashCode ^ scale.hashCode ^ imageStore.hashCode;

  @override
  String toString() {
    return 'ViewImage{page: $page, scale: $scale}';
  }
}
