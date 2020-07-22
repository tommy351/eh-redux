import 'dart:async';
import 'dart:io';
import 'dart:ui' as ui;

import 'package:eh_redux/models/image.dart';
import 'package:eh_redux/stores/image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ViewImage extends ImageProvider<ViewImage> {
  ViewImage({
    @required this.options,
    @required this.imageStore,
    this.scale = 1.0,
  })  : assert(options != null),
        assert(imageStore != null);

  static final _httpClient = HttpClient()..autoUncompress = false;
  static const _imageLoadTimeout = Duration(seconds: 10);

  final ImageLoadOptions options;
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

      await imageStore.loadImage(options);

      final image = imageStore.getImageByPage(options.galleryIdWithPage);
      final url = Uri.base.resolve(image.url);
      final request = await _httpClient.getUrl(url).timeout(_imageLoadTimeout);
      final response = await request.close().timeout(_imageLoadTimeout);

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
          options == other.options &&
          scale == other.scale &&
          imageStore == other.imageStore;

  @override
  int get hashCode => options.hashCode ^ scale.hashCode ^ imageStore.hashCode;
}
