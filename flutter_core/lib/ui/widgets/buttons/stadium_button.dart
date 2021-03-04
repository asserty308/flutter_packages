import 'package:flutter/material.dart';

/// A non-elevated button with an optional border and fill color.
class StadiumButton extends StatelessWidget {
  const StadiumButton({
    Key? key, 
    this.width,
    this.height,
    this.child, 
    this.onPressed,
    this.backgroundColor,
    this.side,
  }) : super(key: key);

  final Widget? child; 
  final Function()? onPressed;
  final Color? backgroundColor;
  final double? width;
  final double? height;
  final BorderSide? side;

  @override
  Widget build(BuildContext context) => Container(
    width: width,
    height: height,
    child: _button,
  );
  
  Widget get _button => OutlinedButton(
    style: _style,
    clipBehavior: Clip.antiAlias,
    onPressed: onPressed,
    child: child!,
  );

  ButtonStyle get _style => OutlinedButton.styleFrom(
    shape: StadiumBorder(),
    backgroundColor: backgroundColor,
    side: side ?? BorderSide(
      style: BorderStyle.none,
    ),
  );
}
