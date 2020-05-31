import 'dart:async';
import 'dart:convert';
import 'dart:developer' as developer;

import 'package:ehreader/models/gallery.dart';
import 'package:ehreader/models/http_exception.dart';
import 'package:ehreader/models/image.dart';
import 'package:ehreader/utils/css.dart';
import 'package:html/parser.dart' show parse;
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

class EHentaiClient {
  static const baseUrl = 'https://e-hentai.org';
  static const apiUrl = 'https://api.e-hentai.org/api.php';

  final http.Client httpClient;

  EHentaiClient({
    @required this.httpClient,
  }) : assert(httpClient != null);

  Future<List<GalleryId>> getGalleryIds(int page) async {
    developer.log('Get gallery ids (page: $page)');
    final res = await httpClient.get('$baseUrl/?page=$page');

    if (res.statusCode != 200) {
      throw HttpException.fromResponse(
        message: 'Failed to get gallery ids',
        response: res,
      );
    }

    final document = parse(res.body);
    final List<GalleryId> ids = [];

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

      ids.add(GalleryId(id: id, token: token));
    }

    return ids;
  }

  Future<List<Gallery>> getGalleriesData(List<GalleryId> ids) async {
    developer.log('Get galleries data (ids: $ids)');
    final res = await httpClient.post(
      'https://api.e-hentai.org/api.php',
      body: jsonEncode({
        'method': 'gdata',
        'gidlist': ids.map((e) => [e.id, e.token]).toList(growable: false),
      }),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (res.statusCode != 200) {
      throw HttpException.fromResponse(
        message: 'Failed to fetch galleries data',
        response: res,
      );
    }

    Map data = jsonDecode(res.body);

    List<Gallery> galleries = [];

    for (final json in data['gmetadata'] ?? []) {
      final value = json as Map<String, dynamic>;

      if (!value.containsKey('error')) {
        galleries.add(Gallery.fromJson(value));
      }
    }

    return galleries;
  }

  Future<List<ImageId>> getImageIds(GalleryId galleryId, int page) async {
    developer.log('Get image ids (id: $galleryId, page: $page)');
    final res = await httpClient.get(
        'https://e-hentai.org/g/${galleryId.id}/${galleryId.token}/?p=$page');

    if (res.statusCode != 200) {
      throw HttpException.fromResponse(
        message: 'Failed to fetch image ids',
        response: res,
      );
    }

    final document = parse(res.body);
    final List<ImageId> ids = [];

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

      ids.add(ImageId(galleryId: galleryId, page: page, key: key));
    }

    return ids;
  }

  Future<Image> getImageData(ImageId id) async {
    developer.log('Fetch image data (id: $id)');
    final res = await httpClient
        .get('https://e-hentai.org/s/${id.key}/${id.galleryId.id}-${id.page}');

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

    return Image(
      id: id,
      url: src,
      width: int.tryParse(style['width']),
      height: int.tryParse(style['height']),
    );
  }
}
