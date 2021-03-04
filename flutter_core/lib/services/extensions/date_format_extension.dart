import 'package:intl/intl.dart';

extension DateFormatExt on DateFormat {
  DateTime? tryParse(String? input) {
    if (input == null || input.isEmpty || input == 'null') {
      return null;
    }
    
    try {
      return this.parse(input);
    } catch (e) {
      print('DateFormatExt::tryParse Unable to parse $input');
      return null;
    }
  }
}