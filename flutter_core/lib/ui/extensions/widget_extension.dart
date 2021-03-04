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

  Widget paddingOnly({double left = 0.0, double top = 0.0, double right = 0.0, double bottom = 0.0}) => Padding(
    padding: EdgeInsets.only(left: left, top: top, right: right, bottom: bottom),
    child: this,
  );

  Widget paddingHorizontal(double padding) => Padding(
    padding: EdgeInsets.symmetric(horizontal: padding),
    child: this,
  );

  Widget paddingVertical(double padding) => Padding(
    padding: EdgeInsets.symmetric(vertical: padding),
    child: this,
  );

  Widget get expanded => Expanded(
    child: this,
  ); 

  Widget get flexible => Flexible(
    child: this,
  );

  Widget withTooltip(String message) => Tooltip(
    message: message,
    child: this,
  );
}