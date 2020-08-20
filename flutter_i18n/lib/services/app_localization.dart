import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// How to use:
/// Inside pubspec.yaml add under dependencies:
/// ```dart
/// flutter_localizations:
///    sdk: flutter
/// ```
/// Create the json files containing the localized keys inside a new top level directory. 
/// By default this class looks at i18n/.
/// Reference all files as new assets inside pubspec.yaml.
/// Assign [supportedLocales], [localizationsDelegates] and [localeResolutionCallback] in MaterialApp.
class AppLocalization {
  // TODO(ya): Make lookup directory customizable.
  AppLocalization(
    this.locale
  );

  final Locale locale;

  // Static member to have a simple access to the delegate from the MaterialApp
  static const LocalizationsDelegate<AppLocalization> delegate = _AppLocalizationDelegate();

  /// Default supported languages are english and german.
  /// Can be modified from the app.
  static List<String> supportedLocals = ['en', 'de'];

  // Helper method to keep the code in the widgets concise
  // Localizations are accessed using an InheritedWidget "of" syntax
  static AppLocalization of(BuildContext context) {
    return Localizations.of<AppLocalization>(context, AppLocalization);
  }

  Map<String, String> _localizedStrings;

  Future<bool> load() async {
    // Load the language JSON file from the "lang" folder
    final String jsonString = await rootBundle.loadString('i18n/${locale.languageCode}.json');
    final Map<String, dynamic> jsonMap = json.decode(jsonString);

    _localizedStrings = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });

    return true;
  }

  // This method will be called from every widget which needs a localized text
  String translate(String key) {
    return _localizedStrings[key];
  }
}

// LocalizationsDelegate is a factory for a set of localized resources
// In this case, the localized strings will be gotten in an AppLocalizations object
class _AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {
  const _AppLocalizationDelegate();

  @override
  bool isSupported(Locale locale) {
    // Include all of your supported language codes here
    return AppLocalization.supportedLocals.contains(locale.languageCode);
  }

  @override
  Future<AppLocalization> load(Locale locale) async {
    // AppLocalizations class is where the JSON loading actually runs
    final AppLocalization localizations = AppLocalization(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(_AppLocalizationDelegate old) => false;
}