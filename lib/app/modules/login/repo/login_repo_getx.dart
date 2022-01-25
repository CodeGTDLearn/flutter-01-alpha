import 'dart:async';

import 'package:flutter_01_alpha/app/core/components/timer_messager_indicator_adaptive.dart';
import 'package:flutter_01_alpha/app/core/exceptions/bad_format_exception.dart';
import 'package:flutter_01_alpha/app/core/exceptions/global_exception.dart';
import 'package:flutter_01_alpha/app/core/exceptions/htttp_fail_exception.dart';
import 'package:flutter_01_alpha/app/core/exceptions/no_connection_exception.dart';
import 'package:flutter_01_alpha/app/core/properties.dart';
import 'package:get/get_connect.dart';
import 'package:get/instance_manager.dart';

import 'i_login_repo.dart';

class LoginRepoGetx extends GetConnect implements ILoginRepo {
  final _properties = Get.find<Properties>();

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
            if(response.hasError) _exceptionsThrower(response);
            return response.body.toString() == "true" ? true : false;})
          .catchError((onError) {
            print(onError);
            TimerMessageIndicatorAdaptive.message(
                message: onError.toString(),
                fontSize: 20);
            });
    // @formatter:on
  }

  void _exceptionsThrower(Response response) {
    if (response.status.connectionError) throw NoConnectException();
    if (response.status.isServerError) throw NoConnectException();
    if (response.status.code == 422) throw BadFormatException();
    if (response.status.isNotFound) throw HttpFailException();
    if (response.status.hasError) throw GlobalException();
  }
}