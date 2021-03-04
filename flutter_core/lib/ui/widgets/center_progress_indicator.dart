import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_core/ui/extensions/widget_extension.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class CenterProgressIndicator extends StatelessWidget {
  const CenterProgressIndicator({
    Key? key, 
    this.radius = 15,
    this.makeBright = true,
  }) : super(key: key);
  
  final double radius;
  final bool makeBright;

  @override
  Widget build(BuildContext context) => Theme(
    data: ThemeData(
      cupertinoOverrideTheme: CupertinoThemeData(
        brightness: makeBright ? Brightness.dark : Brightness.light,
      )
    ),
    child: PlatformCircularProgressIndicator(
      cupertino: (context, platform) => CupertinoProgressIndicatorData(radius: 15),
    ),
  ).centered;
}