extension StringUrlExtension on String {
  /// Removes the url scheme (e.g. https://, ftp://, etc.) from a url string.
  /// - A url scheme can have 2-20 case independent characters
  /// - A url scheme ends with ://
  String removeUrlScheme() => replaceFirst(RegExp(r'([a-zA-Z]{2,20}):\/\/'), '');

  /// Converts this string to a url by adding the https (or optionally http) scheme and the [path].
  String toUrl(String path, {bool forceHttp = false}) {
    final uri = forceHttp ? Uri.http(this, path) : Uri.https(this, path);
    return uri.toString();
  }

  List<String> splitBaseAndPath() {
    // look for default path elements
    final urlParts = this.split('/');

    String base = '';
    String path = '';

    if (urlParts.length > 1) {
      base = urlParts[0];

      for (int i = 1; i < urlParts.length; i++) {
        final element = urlParts[i];

        if (element.isNotEmpty) {
          path += '/$element';
        }
      }
    }

    return [base, path];
  }
}
