import 'dart:convert';
import 'dart:io';

import 'package:built_collection/built_collection.dart';
import 'package:eh_redux/models/gallery.dart';
import 'package:eh_redux/repositories/ehentai_client.dart';
import 'package:eh_redux/stores/session.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mockito/mockito.dart';

import '../test_utils/http.dart';
import '../test_utils/io.dart';

class MockSessionStore extends Mock implements SessionStore {}

void main() {
  MockHttpClient httpClient;
  EHentaiClient client;

  setUp(() {
    httpClient = MockHttpClient();
    client = EHentaiClient(
      httpClient: httpClient.client,
      sessionStore: MockSessionStore(),
    );
  });

  group('getGalleryIds', () {
    group('when server respond 200', () {
      setUp(() async {
        httpClient.handle(
          request: ExpectedRequest(url: Uri.parse('${EHentaiClient.baseUrl}/')),
          response: Response(
            await readProjectFileAsString(
                'test/repositories/fixtures/index.html'),
            HttpStatus.ok,
            headers: {
              HttpHeaders.contentTypeHeader: MockHttpClient.htmlContentType,
            },
          ),
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

    group('when server respond 404', () {
      setUp(() {
        httpClient.handle(
          request: ExpectedRequest(url: Uri.parse('${EHentaiClient.baseUrl}/')),
          response: Response('', HttpStatus.notFound),
        );
      });

      test('should throw an exception', () async {
        expect(client.getGalleryIds('/'), throwsException);
      });
    });

    group('when search no hit', () {
      setUp(() async {
        httpClient.handle(
          request: ExpectedRequest(url: Uri.parse('${EHentaiClient.baseUrl}/')),
          response: Response(
            await readProjectFileAsString(
                'test/repositories/fixtures/search_no_hit.html'),
            HttpStatus.ok,
            headers: {
              HttpHeaders.contentTypeHeader: MockHttpClient.htmlContentType,
            },
          ),
        );
      });

      test('should return an empty array', () async {
        expect(await client.getGalleryIds('/'), isEmpty);
      });
    });
  });

  group('getGalleriesData', () {
    group('when server respond 200', () {
      setUp(() async {
        httpClient.handle(
          request: ExpectedRequest(
            url: Uri.parse(EHentaiClient.apiUrl),
            method: 'POST',
            body: jsonEncode({
              'method': 'gdata',
              'gidlist': [
                [1663099, 'd76bb5e89a'],
                [1663615, 'acf3f209ac'],
              ],
              'namespace': '1',
            }),
          ),
          response: Response(
            await readProjectFileAsString(
                'test/repositories/fixtures/gallery_list.json'),
            HttpStatus.ok,
            headers: {
              HttpHeaders.contentTypeHeader: MockHttpClient.jsonContentType,
            },
          ),
        );
      });

      test('should return galleries', () async {
        final galleries = await client.getGalleriesData([
          GalleryId((b) => b
            ..id = 1663099
            ..token = 'd76bb5e89a'),
          GalleryId((b) => b
            ..id = 1663615
            ..token = 'acf3f209ac')
        ]);
        expect(
            galleries,
            equals(<Gallery>[
              Gallery((b) => b
                ..id = GalleryId((b) => b
                  ..id = 1663099
                  ..token = 'd76bb5e89a').toBuilder()
                ..title =
                    '[PigPanPan (Ikura Nagisa)] 12 Seiza yandere kokuhaku [Chinese] [绅士仓库汉化] [Digital]'
                ..titleJpn = '[PigPanPan (伊倉ナギサ)] 12星座ヤンデレ コクハク [中国翻訳] [DL版]'
                ..category = 'Non-H'
                ..thumbnail =
                    'https://ehgt.org/f5/b6/f5b64c9c924fb032ce1e21c383c9db5edbaedc62-3865428-2508-3541-jpg_l.jpg'
                ..uploader = 'BlossomPlus'
                ..fileCount = 26
                ..fileSize = 79698072
                ..expunged = false
                ..rating = 4.65
                ..tags = BuiltList<GalleryTag>.of([
                  GalleryTag((b) => b
                    ..namespace = 'language'
                    ..tag = 'chinese'),
                  GalleryTag((b) => b
                    ..namespace = 'language'
                    ..tag = 'translated'),
                  GalleryTag((b) => b
                    ..namespace = 'group'
                    ..tag = 'pigpanpan'),
                  GalleryTag((b) => b
                    ..namespace = 'artist'
                    ..tag = 'ikura nagisa'),
                  GalleryTag((b) => b
                    ..namespace = ''
                    ..tag = 'full color'),
                ]).toBuilder()
                ..posted = DateTime.parse('2020-06-17 13:45:15.000Z')),
              Gallery((b) => b
                ..id = GalleryId((b) => b
                  ..id = 1663615
                  ..token = 'acf3f209ac').toBuilder()
                ..title =
                    '[Sagamani. (Sagami Inumaru)] MY TRUE FEELINGS ARE A SECRET (Kill Me Baby) [Chinese] [后悔的神官个人汉化] [Digital]'
                ..titleJpn =
                    '[サガマニ。 (佐上犬丸)] MY TRUE FEELINGS ARE A SECRET (キルミーベイベー) [中国翻訳] [DL版]'
                ..category = 'Non-H'
                ..thumbnail =
                    'https://ehgt.org/b1/9c/b19cf368b5863145308c1c04bcb1d3e4829f1b70-243924-740-1035-jpg_l.jpg'
                ..uploader = '乐·黑'
                ..fileCount = 16
                ..fileSize = 5450803
                ..expunged = false
                ..rating = 4.5
                ..tags = BuiltList<GalleryTag>.of([
                  GalleryTag((b) => b
                    ..namespace = 'language'
                    ..tag = 'chinese'),
                  GalleryTag((b) => b
                    ..namespace = 'language'
                    ..tag = 'translated'),
                  GalleryTag((b) => b
                    ..namespace = 'parody'
                    ..tag = 'kill me baby'),
                  GalleryTag((b) => b
                    ..namespace = 'character'
                    ..tag = 'sonya'),
                  GalleryTag((b) => b
                    ..namespace = 'character'
                    ..tag = 'yasuna oribe'),
                  GalleryTag((b) => b
                    ..namespace = 'group'
                    ..tag = 'sagamani'),
                  GalleryTag((b) => b
                    ..namespace = 'artist'
                    ..tag = 'sagami inumaru'),
                  GalleryTag((b) => b
                    ..namespace = 'female'
                    ..tag = 'females only'),
                  GalleryTag((b) => b
                    ..namespace = 'female'
                    ..tag = 'schoolgirl uniform'),
                  GalleryTag((b) => b
                    ..namespace = 'female'
                    ..tag = 'twintails'),
                ]).toBuilder()
                ..posted = DateTime.parse('2020-06-18 08:37:04.000Z'))
            ]));
      });
    });

    group('when server respond 404', () {
      setUp(() {
        httpClient.handle(
          request: ExpectedRequest(
            url: Uri.parse(EHentaiClient.apiUrl),
            method: 'POST',
          ),
          response: Response('', HttpStatus.notFound),
        );
      });

      test('should throw an exception', () async {
        expect(client.getGalleryIds('/'), throwsException);
      });
    });
  });

  group('getGalleryDetails', () {});

  group('getFavoriteStatus', () {});

  group('addToFavorite', () {});

  group('deleteFromFavorite', () {});

  group('getGalleryUrl', () {});

  group('getImageUrl', () {});

  group('getImageIds', () {});

  group('getImageData', () {});
}
