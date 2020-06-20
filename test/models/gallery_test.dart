import 'package:eh_redux/models/gallery.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('GalleryTag', () {
    group('fromString', () {
      test('without namespace', () {
        expect(
            GalleryTag.fromString('foo'), equals(const GalleryTag(tag: 'foo')));
      });

      test('with namespace', () {
        expect(GalleryTag.fromString('female:ahegao'),
            equals(const GalleryTag(namespace: 'female', tag: 'ahegao')));
      });

      test('tag with spaces', () {
        expect(GalleryTag.fromString('female:big breasts'),
            equals(const GalleryTag(namespace: 'female', tag: 'big breasts')));
      });
    });

    group('shortTag', () {
      test('empty namespace', () {
        expect(const GalleryTag(tag: 'foo').shortTag, equals('foo'));
      });

      test('with namespace', () {
        expect(const GalleryTag(namespace: 'female', tag: 'ponytail').shortTag,
            equals('f:ponytail'));
      });

      test('with langauge namespace', () {
        expect(
            const GalleryTag(namespace: 'language', tag: 'translated').shortTag,
            equals('translated'));
      });
    });

    group('fullTag', () {
      test('empty namespace', () {
        expect(const GalleryTag(tag: 'foo').fullTag, equals('foo'));
      });

      test('with namespace', () {
        expect(const GalleryTag(namespace: 'female', tag: 'ponytail').fullTag,
            equals('female:ponytail'));
      });
    });
  });
}
