import 'package:flutter/material.dart';
import 'package:flutter_core/ui/extensions/widget_extension.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class CenterProgressIndicator extends StatelessWidget {
  const CenterProgressIndicator({Key? key, this.radius = 15}) : super(key: key);
  
  final double radius;

  @override
  Widget build(BuildContext context) {
    return PlatformCircularProgressIndicator(
      cupertino: (context, platform) => CupertinoProgressIndicatorData(radius: 15),
    ).centered;
  }
}