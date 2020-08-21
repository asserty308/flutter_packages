import 'package:dio/dio.dart';
import 'package:flutter_web/services/dio_service.dart';
import 'package:flutter_web/utility/string_url_extension.dart';
import 'package:flutter_web/utility/string_file_extension.dart';

/// How to use:
/// ```dart
/// class AppApi extends BaseApi {
///   AppApi() : super('myapi.com');
///   ...
/// }
/// ```
class BaseApi {
  BaseApi(String baseUrl, {this.forceHttp = false}) {
    // baseUrl is not allowed to contain http[s] prefix
    final tmpUrl = baseUrl.removeUrlScheme();

    final baseAndPath = tmpUrl.splitBaseAndPath();
    _baseUrl = baseAndPath[0];
    _defaultPath = baseAndPath[1];
  }
  
  final bool forceHttp;

  String _baseUrl;
  String _defaultPath = '';

  DioService _dio = DioService();

  /// Uses a POST request to send any data data to an url.
  /// Throws an Exception when an error occures.
  Future<dynamic> doRequest(String urlPath, {dynamic data, Map<String, dynamic> headers, Map<String, dynamic> query, bool isPOST = false}) async {
    await _dio.init();

    // update path when a default path is available
    final path = _defaultPath.isEmpty ? urlPath : '$_defaultPath/$urlPath';
    final url = _baseUrl.toUrl(path, forceHttp: forceHttp);
    
    final options = Options(
      headers: headers,
    );

    final response = await _dio.request(url, data: data, options: options, queryParameters: query, isPOST: isPOST);
    final statusCode = response?.statusCode ?? 0;

    if (statusCode != 200) {
      print('Received error $statusCode (${response.statusMessage}) on $url');
      throw Exception('$statusCode - ${response.statusMessage}');
    }

    final dataStr = response.data.toString();

    if (!dataStr.startsWith('{')) {
      print('Unexpected response from $urlPath: $dataStr');
      throw Exception('Unexpected response');
    }

    return response.data;
  }

  /// Uploads a file to an URL by using [FormData].
  /// Throws an Exception when an error occures.
  /// On PHP the uploaded file can be accessed with $_FILES['file'].
  Future<dynamic> postFile(String urlPath, String filePath, {Map<String, dynamic> query, Map<String, dynamic> headers}) async {
    // Get filename from path and remove whitespace from filename before upload
    String fileName = filePath.filenameFromPath(true);

    final multipartFile = await MultipartFile.fromFile(filePath, filename: fileName);

    final data = FormData.fromMap({
      'file': multipartFile,
    });

    return await doRequest(urlPath, data: data, headers: headers, query: query);
  }
}