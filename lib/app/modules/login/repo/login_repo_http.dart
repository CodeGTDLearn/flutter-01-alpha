import 'package:flutter_01_alpha/app/core/properties.dart';
import 'package:get/instance_manager.dart';
import 'package:http/http.dart' as http;

import 'i_login_repo.dart';

class LoginRepoHttp extends ILoginRepo {
  final _properties = Get.find<Properties>();

  @override
  Future<bool> authentication(String email) {
    var url = "${_properties.apiRootUrl}${_properties.employeeEndp}/$email";
    // @formatter:off
    return
      http
          .get(Uri.parse(url))
          .then((response) {
              return response.body == "true" ? true : false;
          })
          .catchError((onError) => throw onError);
    // @formatter:on
  }
}