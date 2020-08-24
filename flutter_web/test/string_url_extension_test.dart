import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_web/utility/string_url_extension.dart';

void main() {
  group('removeUrlScheme', () {
    test('Remove http scheme', () {
      final String result = 'http://www.google.com'.removeUrlScheme();
      expect(result, 'www.google.com');
    });

    test('Remove https scheme', () {
      final String result = 'https://www.google.com'.removeUrlScheme();
      expect(result, 'www.google.com');
    });
  });

  group('toUrl', () {
    test('google.de should become https://google.com/maps', () {
      final String result = 'google.de'.toUrl('maps');
      expect(result, 'https://google.de/maps');
    });
  });
  
}
