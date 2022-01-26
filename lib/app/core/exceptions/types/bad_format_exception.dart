
import 'package:get/get_connect/http/src/response/response.dart';

class BadFormatException implements Exception {

  Response? response;

  BadFormatException({this.response});

  @override
  String toString() {
    /// The decoded body of this [Response]. You can access the
    /// body parameters as Map
    /// Ex: `body['title'];`
    var _code = response == null ? 0 : "- Code: ${response?.statusCode}";
    return "Bad response format $_code";
  }
}