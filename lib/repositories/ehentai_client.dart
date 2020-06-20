import 'dart:async';
import 'dart:convert';
import 'dart:developer' as developer;
import 'dart:io';

import 'package:eh_redux/models/content_warning_exception.dart';
import 'package:eh_redux/models/favorite.dart';
import 'package:eh_redux/models/gallery.dart';
import 'package:eh_redux/models/image.dart';
import 'package:eh_redux/models/request_exception.dart';
import 'package:eh_redux/stores/session.dart';
import 'package:eh_redux/utils/css.dart';
import 'package:eh_redux/utils/string.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
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
  static const _userAgent =
      'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36';

  final http.Client httpClient;
  final SessionStore sessionStore;

  Future<Map<String, String>> _getRequestHeaders({
    bool disableContentWarning = false,
  }) async {
    final cookies = [await sessionStore.session];

    if (disableContentWarning) {
      cookies.add('nw=1');
    }

    return {
      HttpHeaders.cookieHeader: cookies.join(';'),
      HttpHeaders.userAgentHeader: _userAgent,
    };
  }

  Future<List<GalleryId>> getGalleryIds(String path) async {
    developer.log('Get gallery ids (path: $path)');
    final res = await httpClient.get(
      '$baseUrl$path',
      headers: await _getRequestHeaders(),
    );

    if (res.statusCode != HttpStatus.ok) {
      throw RequestException.fromResponse(
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

      ids.add(GalleryId(id: id, token: token));
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
      throw RequestException.fromResponse(
        message: 'Failed to fetch galleries data',
        response: res,
      );
    }

    final data = jsonDecode(res.body) as Map;
    final galleries = <Gallery>[];

    for (final json in data['gmetadata'] ?? []) {
      final value = json as Map<String, dynamic>;

      if (!value.containsKey('error')) {
        final galleryRes = GalleryResponse.fromJson(value);
        galleries.add(Gallery.fromResponse(galleryRes));
      }
    }

    return galleries;
  }

  Future<GalleryDetails> getGalleryDetails(
    GalleryId id, {
    bool disableContentWarning = false,
  }) async {
    developer.log('Get gallery details (id: $id)');
    final res = await httpClient.get(
      getGalleryUrl(id),
      headers: await _getRequestHeaders(
        disableContentWarning: disableContentWarning,
      ),
    );

    if (res.statusCode != HttpStatus.ok) {
      throw RequestException.fromResponse(
        message: 'Failed to get gallery details',
        response: res,
      );
    }

    final document = await compute(parse, res.body);

    _validateGalleryDocument(document: document, response: res, id: id);

    return GalleryDetails(
      favoritesCount: _getFavoritesCount(document) ?? 0,
      ratingCount: _getRatingCount(document) ?? 0,
      currentFavorite: _getCurrentFavorite(document),
    );
  }

  void _validateGalleryDocument({
    @required Document document,
    @required http.Response response,
    @required GalleryId id,
  }) {
    // Try to get the header
    if (document.getElementById('nb') == null) {
      throw RequestException.fromResponse(
        message: 'Gallery not found',
        response: response,
      );
    }

    // Test if the content is flagged
    final contentWarning = document.querySelectorAll('h1').firstWhere(
        (element) => element.innerHtml == 'Content Warning',
        orElse: () => null);

    if (contentWarning != null) {
      throw ContentWarningException(
          galleryId: id,
          reason: contentWarning.nextElementSibling
                  ?.querySelector('strong')
                  ?.innerHtml ??
              contentWarning.innerHtml);
    }
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
      throw RequestException.fromResponse(
        message: 'Failed to get favorite status',
        response: res,
      );
    }

    final document = await compute(parse, res.body);

    return FavoriteStatus(
      favorite: _getFavorite(document),
      note: document.querySelector('textarea[name="favnote"]').innerHtml,
    );
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
      throw RequestException.fromResponse(
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
      throw RequestException.fromResponse(
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
      headers: await _getRequestHeaders(
        disableContentWarning: true,
      ),
    );

    if (res.statusCode != HttpStatus.ok) {
      throw RequestException.fromResponse(
        message: 'Failed to fetch image ids',
        response: res,
      );
    }

    final document = await compute(parse, res.body);

    _validateGalleryDocument(document: document, response: res, id: galleryId);

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

      ids.add(ImageId(
        galleryId: galleryId,
        page: page,
        key: key,
      ));
    }

    return ids;
  }

  Future<Image> getImageData(ImageId id) async {
    developer.log('Fetch image data (id: $id)');
    final res = await httpClient.get(
      getImageUrl(id),
      headers: await _getRequestHeaders(
        disableContentWarning: true,
      ),
    );

    if (res.statusCode != HttpStatus.ok) {
      throw RequestException.fromResponse(
        message: 'Failed to fetch image meta',
        response: res,
      );
    }

    final document = await compute(parse, res.body);
    final img = document.getElementById('img');

    if (img == null) {
      throw RequestException.fromResponse(
        message: 'Image not found',
        response: res,
      );
    }

    final src = img.attributes['src'];
    final style = parseRules(img.attributes['style']);

    return Image(
      id: id,
      url: src,
      width: int.tryParse(trimSuffix(style['width'], 'px')),
      height: int.tryParse(trimSuffix(style['height'], 'px')),
    );
  }
}
