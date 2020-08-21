import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

class DioService {
  Dio _dio;
  bool dioInitialized = false;

  /// Initializes dio only once per session
  Future<void> init() async {
    if (dioInitialized) {
      return;
    }

    _dio = Dio();
    dioInitialized = true;

    await _initCookieManager();
  }

  /// Cookie management to keep session alive when app restarts.
  /// - not needed for web because browsers handle cookies automatically
  Future<void> _initCookieManager() async {
    if (kIsWeb) {
      return;
    }

    final appDocDir = await getApplicationDocumentsDirectory();
    final cookieJar = PersistCookieJar(dir: appDocDir.path + '/.cookies/');
    final manager = CookieManager(cookieJar);

    _dio.interceptors.add(manager);
  }

  Future<dynamic> request(String path, {dynamic data, Map<String, dynamic> queryParameters, Options options, bool isPOST = false}) async {
    if (isPOST) {
      return post(path, data: data, queryParameters: queryParameters, options: options);
    }

    return get(path, queryParameters: queryParameters, options: options);
  }

  /// Wrapper for dio.get
  Future<dynamic> get(String path, {Map<String, dynamic> queryParameters, Options options}) async {
    return await _dio.get(path, queryParameters: queryParameters, options: options);
  }

  /// Wrapper for dio.post
  Future<dynamic> post(String path, {dynamic data, Map<String, dynamic> queryParameters, Options options}) async {
    return await _dio.post(path, data: data, queryParameters: queryParameters, options: options);
  }
}