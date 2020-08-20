import 'package:flutter/material.dart';

extension AppWidget on Widget {
  Widget get centered => Center(
    child: this
  );

  Widget paddingAll(double value) => Padding(
    padding: EdgeInsets.all(value),
    child: this,
  );

  Widget paddingLTRB(double left, double top, double right, double bottom) => Padding(
    padding: EdgeInsets.fromLTRB(left, top, right, bottom),
    child: this,
  );
}