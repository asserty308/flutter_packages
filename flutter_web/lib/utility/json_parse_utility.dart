import 'package:intl/intl.dart';
import 'package:flutter_core/services/extensions/date_format_extension.dart';

class JsonParseUtility {
  static int parseInt(dynamic value) => int.tryParse(value?.toString() ?? '0') ?? 0;
  static DateTime? parseDate(dynamic value, {String dateFormat = 'yyyy-MM-dd'}) => DateFormat(dateFormat).tryParse(value?.toString() ?? '');
  static DateTime? parseDateTime(dynamic value, {String dateFormat = 'yyyy-MM-dd HH:mm:ss'}) => DateFormat(dateFormat).tryParse(value?.toString() ?? '');
  static String parseString(dynamic value) => value?.toString() ?? '';
}