import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:eh_redux/utils/http.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

@immutable
class _LoadArguments {
  const _LoadArguments({
    required this.key,
    required this.chunkEvents,
    required this.decode,
  });

  final FileFallbackImage key;
  final StreamController<ImageChunkEvent> chunkEvents;
  final DecoderCallback decode;
}

class FileFallbackImage extends ImageProvider<FileFallbackImage> {
  FileFallbackImage({
    required this.getFile,
    required this.url,
    this.cacheManager,
    this.scale = 1.0,
  });

  static final _httpClient = HttpClient()..autoUncompress = false;

  final FutureOr<File?> Function() getFile;
  final String url;
  final BaseCacheManager? cacheManager;
  final double scale;

  @override
  Future<FileFallbackImage> obtainKey(
    ImageConfiguration configuration,
  ) {
    return SynchronousFuture<FileFallbackImage>(this);
  }

  @override
  ImageStreamCompleter load(
    FileFallbackImage key,
    DecoderCallback decode,
  ) {
    final StreamController<ImageChunkEvent> chunkEvents =
        StreamController<ImageChunkEvent>();

    final args = _LoadArguments(
      key: key,
      chunkEvents: chunkEvents,
      decode: decode,
    );

    return MultiFrameImageStreamCompleter(
      codec: _loadAsync(args),
      chunkEvents: chunkEvents.stream,
      scale: key.scale,
      informationCollector: () {
        return <DiagnosticsNode>[
          DiagnosticsProperty<ImageProvider>('Image provider', this),
          DiagnosticsProperty<FileFallbackImage>('Image key', key),
        ];
      },
    );
  }

  Future<Codec> _loadAsync(_LoadArguments args) async {
    try {
      assert(args.key == this);

      final file = await Future.sync(args.key.getFile);

      if (file != null) {
        return _loadFile(args, file);
      }

      final cacheManager = args.key.cacheManager;

      if (cacheManager != null) {
        return _loadCache(args, cacheManager);
      }

      return _loadNetwork(args);
    } finally {
      args.chunkEvents.close();
    }
  }

  Future<Codec> _loadFile(_LoadArguments args, File file) async {
    final bytes = await file.readAsBytes();

    if (bytes.lengthInBytes == 0) {
      // The file may become available later.
      PaintingBinding.instance?.imageCache?.evict(args.key);
      throw StateError('$file is empty and cannot be loaded as an image.');
    }

    return args.decode(bytes);
  }

  Future<Codec> _loadCache(
    _LoadArguments args,
    BaseCacheManager cacheManager,
  ) async {
    final stream = cacheManager.getFileStream(
      args.key.url,
      withProgress: true,
    );
    final completer = Completer<File>();

    stream.listen((event) {
      if (event is DownloadProgress && !args.chunkEvents.isClosed) {
        args.chunkEvents.add(ImageChunkEvent(
          cumulativeBytesLoaded: event.downloaded,
          expectedTotalBytes: event.totalSize,
        ));
      }

      if (event is FileInfo) {
        completer.complete(event.file);
      }
    }, onError: completer.completeError, cancelOnError: true);

    return _loadFile(args, await completer.future);
  }

  Future<Codec> _loadNetwork(_LoadArguments args) async {
    final uri = Uri.parse(args.key.url);
    final req = await _httpClient.getUrl(uri);
    final res = await req.close();

    if (!isStatusCodeOk(res.statusCode)) {
      PaintingBinding.instance?.imageCache?.evict(args.key);
      throw NetworkImageLoadException(
        statusCode: res.statusCode,
        uri: uri,
      );
    }

    final bytes = await consolidateHttpClientResponseBytes(
      res,
      onBytesReceived: (cumulative, total) {
        args.chunkEvents.add(ImageChunkEvent(
          cumulativeBytesLoaded: cumulative,
          expectedTotalBytes: total,
        ));
      },
    );

    if (bytes.lengthInBytes == 0) {
      throw Exception('FileFallbackImage is an empty file: $url');
    }

    return args.decode(bytes);
  }

  @override
  int get hashCode => hashValues(getFile, url, cacheManager, scale);

  @override
  bool operator ==(Object other) {
    return other is FileFallbackImage &&
        getFile == other.getFile &&
        url == other.url &&
        cacheManager == other.cacheManager &&
        scale == other.scale;
  }

  @override
  String toString() =>
      '${objectRuntimeType(this, 'FileFallbackImageProvider')}(url: "$url", scale: $scale)';
}
