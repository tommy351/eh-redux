import 'package:eh_redux/utils/string.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('trimPrefix', () {
    expect(trimPrefix('abcdefg', 'abc'), equals('defg'));
    expect(trimPrefix('abcdefg', 'bcd'), equals('abcdefg'));
  });

  test('trimSuffix', () {
    expect(trimSuffix('abcdefg', 'efg'), equals('abcd'));
    expect(trimSuffix('abcdefg', 'bcd'), equals('abcdefg'));
  });
}
