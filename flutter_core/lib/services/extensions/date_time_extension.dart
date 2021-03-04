extension DateTimeExt on DateTime {
  bool get isToday {
    final today = DateTime.now();
    return this.day == today.day && this.month == today.month && this.year == today.year;
  }
}