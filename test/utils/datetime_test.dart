import 'package:eh_redux/utils/datetime.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('tryParseSecondsSinceEpoch', () {
    test('should return null if invalid', () {
      expect(tryParseSecondsSinceEpoch('ajaoerjwoei'), isNull);
    });

    test('should return DateTime', () {
      expect(tryParseSecondsSinceEpoch('1592589710'),
          equals(DateTime.parse('2020-06-19T18:01:50Z')));
    });
  });
}
