import 'package:flutter/material.dart';

class StadiumTextField extends StatelessWidget {
  const StadiumTextField({
    required this.controller,
    this.height,
    this.hint,
    this.iconPath,
    this.focusNode,
    this.onSubmitted,
    this.icon,
    this.borderColor = Colors.black,
    this.focusColor = Colors.blue,
    this.fillColor = Colors.white,
    this.obscured = false,
  });

  final String? hint, iconPath;
  final double? height;
  final TextEditingController controller;
  final bool obscured;
  final Color borderColor, focusColor, fillColor;
  final Widget? icon;
  final Function()? onSubmitted;

  /// Used to request focus on specific events
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) => Container(
    height: height,
    child: TextField(
      controller: controller,
      obscureText: obscured,
      decoration: _inputDecoration,
      onSubmitted: (_) => onSubmitted!(),
    ),
  );

  InputDecoration get _inputDecoration => InputDecoration(
    hintText: hint,
    focusColor: focusColor,
    icon: icon,
    filled: true,
    fillColor: fillColor,
    enabledBorder: _border,
    focusedBorder: _border,
  );

  OutlineInputBorder get _border => OutlineInputBorder(
    borderRadius: BorderRadius.circular(height! * 0.5),
    borderSide: BorderSide(color: borderColor),
  );
}