import 'package:eh_redux/utils/css.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('parse CSS rules', () {
    expect(
        parseRules(
            'width: 300px; height: 400px; font-family: Arial, sans-serif;'),
        equals({
          'width': '300px',
          'height': '400px',
          'font-family': 'Arial, sans-serif',
        }));
  });
}
