import 'dart:async';

import 'package:flutter_01_alpha/app/core/exceptions/global_exceptions_handler.dart';
import 'package:flutter_01_alpha/app/core/properties/app_core_datasource_urls.dart';
import 'package:get/get_connect.dart';
import 'package:get/instance_manager.dart';

import 'i_login_repo.dart';

class LoginRepoGetx extends GetConnect implements ILoginRepo {
  final _properties = Get.find<AppCoreDatasourceUrls>();
  final _exceptions = Get.find<GlobalExceptionsHandler>();

  @override
  void onInit() {
    httpClient
      ..baseUrl = _properties.apiRootUrl
      ..defaultContentType = "application/json"
      ..timeout = const Duration(seconds: 8);
    // httpClient.baseUrl = _properties.apiRootUrl;
    // httpClient.defaultContentType = "application/json";
    // httpClient.timeout = const Duration(seconds: 8);
    // httpClient.errorSafety = false;
    // httpClient.addResponseModifier((request, response) async {
    //   print("addResponseModifier: ${response.body}");
    // });
    super.onInit();
  }

  @override
  Future<bool> authentication(String email) {
    var url = "${_properties.employeeEndp}/$email";
    // @formatter:off
    return get(url)
           .then((response) {
             _exceptions.coreScan(response);
             return response.bodyString == "true" ? true : false;
           });
    // @formatter:on
  }
}