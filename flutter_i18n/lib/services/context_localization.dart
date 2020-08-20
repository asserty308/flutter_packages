import 'package:flutter/material.dart';
import 'package:flutter_i18n/services/app_localization.dart';

extension ContextLocalization on BuildContext {
  String localize(String key) {
    return AppLocalization.of(this).translate(key);
  }
}