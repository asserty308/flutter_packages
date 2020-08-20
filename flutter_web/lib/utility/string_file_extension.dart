extension StringFileExtension on String {
  /// Returns the filename from a file path. Optionally replaces whitespace characters with _. 
  /// This is useful when the file will be uploaded.
  String filenameFromPath([bool replaceWhitespace = false]) {
    String filename = this.split('/').last;

    if (replaceWhitespace) {
      filename = filename.replaceAll(' ', '_');
    }
    
    return filename;
  }
}