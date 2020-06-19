import 'package:eh_redux/utils/cookie.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('parse cookies', () {
    expect(
        parseCookies('foo=bar; bar=baz'),
        equals({
          'foo': 'bar',
          'bar': 'baz',
        }));
  });
}
