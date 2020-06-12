import 'dart:async';
import 'dart:convert';
import 'dart:developer' as developer;
import 'dart:io';

import 'package:eh_redux/models/gallery.dart';
import 'package:eh_redux/models/http_exception.dart';
import 'package:eh_redux/models/image.dart';
import 'package:eh_redux/stores/session.dart';
import 'package:eh_redux/utils/css.dart';
import 'package:eh_redux/utils/string.dart';
import 'package:html/parser.dart' show parse;
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

class EHentaiClient {
  static const baseUrl = 'https://e-hentai.org';
  static const apiUrl = 'https://api.e-hentai.org/api.php';

  final http.Client httpClient;
  final SessionStore sessionStore;

  EHentaiClient({
    @required this.httpClient,
    @required this.sessionStore,
  })  : assert(httpClient != null),
        assert(sessionStore != null);

  Future<Map<String, String>> _getRequestHeaders() async {
    return {
      HttpHeaders.cookieHeader: await sessionStore.session,
    };
  }

  Future<List<GalleryId>> getGalleryIds(String path) async {
    developer.log('Get gallery ids (path: $path)');
    final res = await httpClient.get(
      '$baseUrl$path',
      headers: await _getRequestHeaders(),
    );

    if (res.statusCode != 200) {
      throw HttpException.fromResponse(
        message: 'Failed to get gallery ids',
        response: res,
      );
    }

    final document = parse(res.body);
    final ids = <GalleryId>[];

    for (final element in document.querySelectorAll('.glname > a')) {
      final href = element.attributes['href'];
      if (href == null || href.isEmpty) continue;

      final uri = Uri.tryParse(href);
      if (uri == null) continue;

      final segments = uri.pathSegments;
      if (segments[0] != 'g') continue;

      final id = int.tryParse(segments[1]);
      final token = segments[2];
      if (id == null || token == null) continue;

      ids.add(GalleryId((b) => b
        ..id = id
        ..token = token));
    }

    return ids;
  }

  Future<List<Gallery>> getGalleriesData(List<GalleryId> ids) async {
    developer.log('Get galleries data (ids: $ids)');
    final res = await httpClient.post(
      apiUrl,
      body: jsonEncode({
        'method': 'gdata',
        'gidlist': ids.map((e) => [e.id, e.token]).toList(growable: false),
        'namespace': '1',
      }),
      headers: {
        ...await _getRequestHeaders(),
        'Content-Type': 'application/json',
      },
    );

    if (res.statusCode != 200) {
      throw HttpException.fromResponse(
        message: 'Failed to fetch galleries data',
        response: res,
      );
    }

    final data = jsonDecode(res.body) as Map;
    final galleries = <Gallery>[];

    for (final json in data['gmetadata'] ?? []) {
      final value = json as Map<String, dynamic>;

      if (!value.containsKey('error')) {
        galleries.add(Gallery.fromJson(value));
      }
    }

    return galleries;
  }

  String getGalleryUrl(GalleryId id) {
    return '$baseUrl/g/${id.id}/${id.token}';
  }

  String getImageUrl(ImageId id) {
    return '$baseUrl/s/${id.key}/${id.galleryId.id}-${id.page}';
  }

  Future<List<ImageId>> getImageIds(GalleryId galleryId, int page) async {
    developer.log('Get image ids (id: $galleryId, page: $page)');
    final res = await httpClient.get(
      '${getGalleryUrl(galleryId)}/?p=$page',
      headers: await _getRequestHeaders(),
    );

    if (res.statusCode != 200) {
      throw HttpException.fromResponse(
        message: 'Failed to fetch image ids',
        response: res,
      );
    }

    final document = parse(res.body);
    final ids = <ImageId>[];

    for (final element in document.querySelectorAll('.gdtm a')) {
      final href = element.attributes['href'];
      if (href == null || href.isEmpty) continue;

      final uri = Uri.tryParse(href);
      if (uri == null) continue;

      final segments = uri.pathSegments;
      if (segments[0] != 's') continue;

      final key = segments[1];
      final parts = segments[2].split('-');

      if (parts.length != 2) continue;

      final gid = int.tryParse(parts[0]);
      final page = int.tryParse(parts[1]);
      if (gid == null || page == null || gid != galleryId.id) continue;

      ids.add(ImageId((b) => b
        ..galleryId = galleryId.toBuilder()
        ..page = page
        ..key = key));
    }

    return ids;
  }

  Future<Image> getImageData(ImageId id) async {
    developer.log('Fetch image data (id: $id)');
    final res = await httpClient.get(
      getImageUrl(id),
      headers: await _getRequestHeaders(),
    );

    if (res.statusCode != 200) {
      throw HttpException.fromResponse(
        message: 'Failed to fetch image meta',
        response: res,
      );
    }

    final document = parse(res.body);
    final img = document.querySelector('#img');
    final src = img.attributes['src'];
    final style = parseRules(img.attributes['style']);

    return Image((b) => b
      ..id = id.toBuilder()
      ..url = src
      ..width = int.tryParse(trimSuffix(style['width'], 'px'))
      ..height = int.tryParse(trimSuffix(style['height'], 'px')));
  }
}
