import 'dart:convert';

class RequestUtility {
  static Map<String, String> buildAuthorizationHeader(String username, String password) {
    final auth64 = base64Encode(utf8.encode('$username:$password'));
    final header = {
      'authorization': 'Basic $auth64',
    };

    return header;
  }
}
