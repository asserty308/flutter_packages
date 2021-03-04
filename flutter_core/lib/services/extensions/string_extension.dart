import 'dart:math';

extension StringExtension on String {
  static String random(int length) {
    const chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    Random rnd = Random.secure();

    return String.fromCharCodes(
      Iterable.generate(length, (_) => chars.codeUnitAt(rnd.nextInt(chars.length)))
    );
  }

  String get removeHtmlTags => replaceAll(RegExp(r'<[^>]*>'), '');
}