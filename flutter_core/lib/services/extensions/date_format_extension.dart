import 'package:intl/intl.dart';

extension DateFormatExt on DateFormat {
  DateTime tryParse(String input) {
    try {
      return this.parse(input);
    } catch (e) {
      print('Unable to parse $input');
      return null;
    }
  }
}