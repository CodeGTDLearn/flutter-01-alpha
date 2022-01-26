import 'package:get/get_connect/http/src/response/response.dart';

class NoConnectException implements Exception {


  Response? response;

  NoConnectException({this.response});

  @override
  String toString() {
    /// The decoded body of this [Response]. You can access the
    /// body parameters as Map
    /// Ex: `body['title'];`
    var _code = response == null ? 0 : "- Code: ${response?.statusCode}";
    return "No Internet Connection $_code";
  }
}