import 'package:flutter_01_alpha/app/core/properties.dart';
import 'package:get/get_connect.dart';
import 'package:get/instance_manager.dart';

import 'i_login_repo.dart';

class LoginRepoGetx extends GetConnect implements ILoginRepo {
  final _properties = Get.find<Properties>();

  @override
  void onInit() {
    httpClient.baseUrl = _properties.apiRootUrl;
    super.onInit();
  }

  @override
  Future<bool> authentication(String email) {
    var url = "${_properties.employeeEndp}/$email";
    // @formatter:off
    return get(url)
          .then((response) {
            // if(response.hasError) _exceptions(response);
              return response.body.toString() == "true" ? true : false;
          });
    // @formatter:on
  }
// void _exceptions(Response response) {
//   var s = response.statusCode;
//   if (s >= 400 && s <= 499) throw Exception('Request Error');
//   if (s >= 500) throw Exception('Server Error');
// }
// dynamic errorHandler(Response response) {
//   print(response.toString());
//   switch (response.statusCode) {
//     case 200:
//     case 201:
//     case 202:
//       var responseJson = response.body.toString();
//       return responseJson;
//     case 500:
//       throw "Server Error pls retry later";
//     case 403:
//       throw 'Error occurred pls check internet and retry.';
//     case 500:
//     default:
//       throw 'Error occurred retry';
//   }
// }
}