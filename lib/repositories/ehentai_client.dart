import 'dart:async';
import 'dart:convert';
import 'dart:developer' as developer;
import 'dart:io';

import 'package:eh_redux/models/favorite.dart';
import 'package:eh_redux/models/gallery.dart';
import 'package:eh_redux/models/http_exception.dart';
import 'package:eh_redux/models/image.dart';
import 'package:eh_redux/stores/session.dart';
import 'package:eh_redux/utils/css.dart';
import 'package:eh_redux/utils/string.dart';
import 'package:flutter/foundation.dart';
import 'package:html/dom.dart';
import 'package:html/parser.dart' show parse;
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

class EHentaiClient {
  EHentaiClient({
    @required this.httpClient,
    @required this.sessionStore,
  })  : assert(httpClient != null),
        assert(sessionStore != null);

  static const baseUrl = 'https://e-hentai.org';
  static const apiUrl = 'https://api.e-hentai.org/api.php';

  final http.Client httpClient;
  final SessionStore sessionStore;

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

    if (res.statusCode != HttpStatus.ok) {
      throw HttpException.fromResponse(
        message: 'Failed to get gallery ids',
        response: res,
      );
    }

    final document = await compute(parse, res.body);
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

    if (res.statusCode != HttpStatus.ok) {
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

  Future<GalleryDetails> getGalleryDetails(GalleryId id) async {
    developer.log('Get gallery details (id: $id)');
    final res = await httpClient.get(
      getGalleryUrl(id),
      headers: await _getRequestHeaders(),
    );

    if (res.statusCode != HttpStatus.ok) {
      throw HttpException.fromResponse(
        message: 'Failed to get gallery details',
        response: res,
      );
    }

    final document = await compute(parse, res.body);

    return GalleryDetails((b) => b
      ..favoritesCount = _getFavoritesCount(document) ?? 0
      ..ratingCount = _getRatingCount(document) ?? 0
      ..currentFavorite = _getCurrentFavorite(document));
  }

  int _getFavoritesCount(Document document) {
    final element = document.getElementById('favcount');
    if (element == null) return null;
    return int.tryParse(trimSuffix(element.text, 'times'));
  }

  int _getRatingCount(Document document) {
    final element = document.getElementById('rating_count');
    if (element == null) return null;
    return int.tryParse(element.text);
  }

  int _getCurrentFavorite(Document document) {
    final element = document.getElementById('favoritelink');
    if (element == null) return -1;
    return int.tryParse(trimPrefix(element.text, 'Favorites ')) ?? -1;
  }

  Future<FavoriteStatus> getFavoriteStatus(GalleryId id) async {
    developer.log('Get favorite status (id: $id)');
    final res = await httpClient.get(
      _getFavPopupUrl(id),
      headers: await _getRequestHeaders(),
    );

    if (res.statusCode != HttpStatus.ok) {
      throw HttpException.fromResponse(
        message: 'Failed to get favorite status',
        response: res,
      );
    }

    final document = await compute(parse, res.body);

    return FavoriteStatus((b) => b
      ..favorite = _getFavorite(document)
      ..note = document.querySelector('textarea[name="favnote"]').innerHtml);
  }

  int _getFavorite(Document document) {
    for (var i = 0; i <= 9; i++) {
      final element = document.getElementById('fav$i');

      if (element.attributes['checked'] == 'checked') {
        return i;
      }
    }

    return -1;
  }

  Future<void> addToFavorite(GalleryId id, FavoriteStatus status) async {
    developer.log('Add gallery to favorite (id: $id)');
    final res = await httpClient.post(
      _getFavPopupUrl(id),
      headers: await _getRequestHeaders(),
      body: {
        'update': '1',
        'favcat': status.favorite.toString(),
        'favnote': status.note,
      },
    );

    if (res.statusCode != HttpStatus.ok) {
      throw HttpException.fromResponse(
        message: 'Failed to add gallery to favorite',
        response: res,
      );
    }
  }

  Future<void> deleteFromFavorite(GalleryId id) async {
    developer.log('Delete gallery from favorites (id: $id)');
    final res = await httpClient.post(
      _getFavPopupUrl(id),
      headers: await _getRequestHeaders(),
      body: {
        'update': '1',
        'favcat': 'favdel',
        'favnote': '',
      },
    );

    if (res.statusCode != HttpStatus.ok) {
      throw HttpException.fromResponse(
        message: 'Failed to delete gallery from favorites',
        response: res,
      );
    }
  }

  String getGalleryUrl(GalleryId id) {
    return '$baseUrl/g/${id.id}/${id.token}';
  }

  String getImageUrl(ImageId id) {
    return '$baseUrl/s/${id.key}/${id.galleryId.id}-${id.page}';
  }

  String _getFavPopupUrl(GalleryId id) {
    return '$baseUrl/gallerypopups.php?gid=${id.id}&t=${id.token}&act=addfav';
  }

  Future<List<ImageId>> getImageIds(GalleryId galleryId, int page) async {
    developer.log('Get image ids (id: $galleryId, page: $page)');
    final res = await httpClient.get(
      '${getGalleryUrl(galleryId)}/?p=$page',
      headers: await _getRequestHeaders(),
    );

    if (res.statusCode != HttpStatus.ok) {
      throw HttpException.fromResponse(
        message: 'Failed to fetch image ids',
        response: res,
      );
    }

    final document = await compute(parse, res.body);
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

    if (res.statusCode != HttpStatus.ok) {
      throw HttpException.fromResponse(
        message: 'Failed to fetch image meta',
        response: res,
      );
    }

    final document = await compute(parse, res.body);
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
