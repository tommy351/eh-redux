import 'dart:io';

import 'package:eh_redux/models/gallery.dart';
import 'package:eh_redux/repositories/ehentai_client.dart';
import 'package:eh_redux/stores/session.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../test_utils/http.dart';
import '../test_utils/io.dart';

class MockSessionStore extends Mock implements SessionStore {}

void main() {
  MockHttpClient httpClient;
  EHentaiClient client;

  setUp(() {
    httpClient = MockHttpClient(EHentaiClient.baseUrl);
    client = EHentaiClient(
      httpClient: httpClient.client,
      sessionStore: MockSessionStore(),
    );
  });

  group('getGalleryIds', () {
    setUp(() async {
      httpClient.handle(
        matcher: const RequestMatcher(path: '/'),
        body: await readProjectFileAsString(
            'test/repositories/fixtures/index.html'),
        headers: {
          HttpHeaders.contentTypeHeader: MockHttpClient.htmlContentType,
        },
      );
    });

    test('should return gallery ids', () async {
      final actual = await client.getGalleryIds('/');
      expect(
          actual,
          equals(<GalleryId>[
            GalleryId((b) => b
              ..id = 1663094
              ..token = '8a3917594c'),
            GalleryId((b) => b
              ..id = 1663074
              ..token = 'b09d849b4a'),
            GalleryId((b) => b
              ..id = 1663093
              ..token = '5f5ce4d611'),
            GalleryId((b) => b
              ..id = 1651072
              ..token = '185e216043'),
            GalleryId((b) => b
              ..id = 1663077
              ..token = '241dc40744'),
            GalleryId((b) => b
              ..id = 1663095
              ..token = 'a9858b9f82'),
            GalleryId((b) => b
              ..id = 1663068
              ..token = '93ad902d30'),
            GalleryId((b) => b
              ..id = 1663088
              ..token = '34e8a96a3f'),
            GalleryId((b) => b
              ..id = 1663067
              ..token = 'a3becc14c0'),
            GalleryId((b) => b
              ..id = 1663091
              ..token = '560510958f'),
            GalleryId((b) => b
              ..id = 1663089
              ..token = '37ecd23bcb'),
            GalleryId((b) => b
              ..id = 1663092
              ..token = 'cdab917112'),
            GalleryId((b) => b
              ..id = 1663090
              ..token = 'f77cd8f436'),
            GalleryId((b) => b
              ..id = 1662987
              ..token = '9050776675'),
            GalleryId((b) => b
              ..id = 1663086
              ..token = 'bc91e854cd'),
            GalleryId((b) => b
              ..id = 1663087
              ..token = '14a7bacd51'),
            GalleryId((b) => b
              ..id = 1663084
              ..token = '6581dc69fa'),
            GalleryId((b) => b
              ..id = 1663085
              ..token = 'eb9998e0e4'),
            GalleryId((b) => b
              ..id = 1663064
              ..token = '7325cce288'),
            GalleryId((b) => b
              ..id = 1663079
              ..token = '1cd08c8705'),
            GalleryId((b) => b
              ..id = 1663082
              ..token = '2b5fdec9b0'),
            GalleryId((b) => b
              ..id = 1663076
              ..token = 'c4210d8673'),
            GalleryId((b) => b
              ..id = 1659335
              ..token = 'e30c2d70f3'),
            GalleryId((b) => b
              ..id = 1663066
              ..token = 'ca8c161486'),
            GalleryId((b) => b
              ..id = 1662455
              ..token = 'd0af5dc691'),
          ]));
    });
  });

  group('getGalleriesData', () {});

  group('getGalleryDetails', () {});

  group('getFavoriteStatus', () {});

  group('addToFavorite', () {});

  group('deleteFromFavorite', () {});

  group('getGalleryUrl', () {});

  group('getImageUrl', () {});

  group('getImageIds', () {});

  group('getImageData', () {});
}
