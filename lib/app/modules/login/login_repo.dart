import 'package:flutter_01_alpha/app/core/properties.dart';
import 'package:get/instance_manager.dart';
import 'package:http/http.dart' as http;

class LoginRepo {
  final _properties = Get.find<Properties>();

  Future<bool> authentication(String email) {
    // @formatter:off
    return
      http
          .get(Uri.parse("${_properties.employeeEndp}/$email"))
          .then((response) {
              return response.body == "true" ? true : false;
          })
          .catchError((onError) => throw onError);
    // @formatter:on
  }

}