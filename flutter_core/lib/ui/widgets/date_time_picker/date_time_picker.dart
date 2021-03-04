import 'package:flutter/material.dart';
import 'package:flutter_core/services/alerts.dart';
import 'package:get_it/get_it.dart';

class DateTimePicker extends StatelessWidget {
  const DateTimePicker({
    Key? key, 
    required this.onDateTimeSelected,
    required this.child,
    required this.initialDate,
  }) : super(key: key);

  final Widget child;
  final DateTime initialDate;
  final Function(DateTime?) onDateTimeSelected;

  @override
  Widget build(BuildContext context) => InkWell(
    onTap: () => _showDatePicker(context),
    child: child,
  );

  Future<void> _showDatePicker(BuildContext context) async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime.now().subtract(const Duration(days: 3650)),
      lastDate: DateTime.now().add(const Duration(days: 3650)),
    );

    if (pickedDate == null) {
      onDateTimeSelected(null);
      return;
    }

    _showTimePicker(context, pickedDate);
  }

  Future<void> _showTimePicker(BuildContext context, DateTime pickedDate) async {
    final pickedTime = await GetIt.I<AlertService>().showTimePicker24(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime == null) {
      onDateTimeSelected(pickedDate);
      return;
    }

    DateTime pickedDateTime = DateTime(pickedDate.year, pickedDate.month, pickedDate.day, pickedTime.hour, pickedTime.minute);
    onDateTimeSelected(pickedDateTime);
  }
}