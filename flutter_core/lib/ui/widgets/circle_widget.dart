import 'package:flutter/material.dart';

class CircleWidget extends StatelessWidget {
  const CircleWidget({
    Key? key, 
    required this.size, 
    required this.child,
    this.backgroundColor = Colors.white,
    this.borderColor = Colors.black,
    this.borderWidth = 2.0,
  }) : super(key: key);

  final double size;
  final Widget child;
  final Color backgroundColor;
  final Color borderColor;
  final double borderWidth;

  @override
  Widget build(BuildContext context) => Container(
    width: size,
    height: size,
    decoration: BoxDecoration(
      color: backgroundColor,
      shape: BoxShape.circle,
      border: Border.all(
        width: borderWidth,
        color: borderColor,
      ),
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(size / 2.0),
      child: child,
    ),
  );
}