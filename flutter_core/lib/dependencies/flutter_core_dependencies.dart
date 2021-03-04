import 'package:flutter_core/services/alerts.dart';
import 'package:flutter_core/services/keyboard.dart';
import 'package:flutter_core/services/url_launcher.dart';
import 'package:get_it/get_it.dart';

class FlutterCoreDependencies {
  static void register() {
    _registerServices();
  }

  static void _registerServices() {
    GetIt.I.registerLazySingleton(() => AlertService());
    GetIt.I.registerLazySingleton(() => KeyboardService());
    GetIt.I.registerLazySingleton(() => UrlLauncherService());
  }
}