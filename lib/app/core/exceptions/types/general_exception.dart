import 'package:get/get_connect/http/src/response/response.dart';

class GeneralException implements Exception {
  Response? response;

  GeneralException([this.response]);

  @override
  String toString() {
    /// The decoded body of this [Response]. You can access the
    /// body parameters as Map
    /// Ex: `body['title'];`
    var _code = response == null ? 0 : "- Code: ${response?.statusCode}";
    return "Something is wronged. Try again later! $_code";
  }
}