import 'package:flutter/material.dart';

class StadiumContainer extends StatelessWidget {
  const StadiumContainer({
    Key? key, 
    this.width, 
    this.height, 
    this.color, 
    this.child
  }) : super(key: key);

  final double? width, height;
  final Color? color;
  final Widget? child;

  @override
  Widget build(BuildContext context) => Container(
    width: width,
    height: height,
    decoration: _decoration,
    child: child,
  );

  BoxDecoration get _decoration => BoxDecoration(
    color: color,
    shape: BoxShape.rectangle,
    borderRadius: BorderRadius.circular(height! * 0.5),
  );
}