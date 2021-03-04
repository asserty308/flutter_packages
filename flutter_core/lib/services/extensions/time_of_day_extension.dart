import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension TimeOfDayExt on TimeOfDay {
  /// Formats this instance to [pattern].
  String formatToPattern([String pattern = 'HH:mm']) {
    final now = DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, this.hour, this.minute);
    return DateFormat(pattern).format(dt);
  }
}