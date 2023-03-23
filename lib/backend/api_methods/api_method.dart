import 'dart:io';

// Header without authorization token
Map<String, String> basicHeaderInfo() {
  return {
    HttpHeaders.acceptHeader: "application/json",
    HttpHeaders.contentTypeHeader: "application/json",
  };
}

// Header with authorization token
Future<Map<String, String>> bearerHeaderInfo() async {
  // String accessToken = LocalStorage.getToken()!;

  return {
    HttpHeaders.acceptHeader: "application/json",
    HttpHeaders.contentTypeHeader: "application/json",
    // HttpHeaders.authorizationHeader: "Bearer $accessToken",
  };
}

// All the method of the api will be here,(ex: GET, POST etc.)
// isBasic => send 'true' flag if the api call don't need token
class ApiMethod {
  ApiMethod({required this.isBasic});

  bool isBasic;
}
