import 'package:flutter_test/flutter_test.dart';
import 'package:githubapp/core/utils/commit_date.dart';

void main() {
  group('Commit date', () {
    test('should be 1 hour', () {
      final value = commitDate('2021-05-08T17:00:00Z', '2021-05-08T18:00:00Z');

      expect(value, equals('1 h'));
    });

    test('should be 1 min', () {
      final value = commitDate('2021-05-08T17:00:00Z', '2021-05-08T17:03:00Z');

      expect(value, equals('3 min'));
    });

    test('should be null', () {
      final value = commitDate('2021-05-08T17:00:00Z', '2021-051-08T17:00:00Z');

      expect(value, equals('aa'));
    });
  });
}
