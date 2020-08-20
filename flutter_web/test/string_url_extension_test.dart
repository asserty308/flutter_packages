import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_web/utility/string_url_extension.dart';

void main() {
  group('removeUrlScheme', () {
    test('Remove http scheme', () {
      final String result = 'http://www.intersolute.de'.removeUrlScheme();
      expect(result, 'www.intersolute.de');
    });

    test('Remove https scheme', () {
      final String result = 'https://www.intersolute.de'.removeUrlScheme();
      expect(result, 'www.intersolute.de');
    });
  });

  group('toUrl', () {
    test('intersolute.de should become https://intersolute.de/admin', () {
      final String result = 'intersolute.de'.toUrl('admin');
      expect(result, 'https://intersolute.de/admin');
    });
  });
  
}
