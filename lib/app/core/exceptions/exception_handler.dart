import 'package:flutter_01_alpha/app/core/exceptions/types/bad_format_exception.dart';
import 'package:flutter_01_alpha/app/core/exceptions/types/global_exception.dart';
import 'package:flutter_01_alpha/app/core/exceptions/types/htttp_fail_exception.dart';
import 'package:flutter_01_alpha/app/core/exceptions/types/no_authenticated_exception.dart';
import 'package:flutter_01_alpha/app/core/exceptions/types/no_connection_exception.dart';
import 'package:get/get_connect/connect.dart';

class ExceptionHandler {

  void handler(Response response) {
    if (response.status.isUnauthorized) throw NoAuthenticatedException();
    if (response.status.isServerError) throw NoConnectException();
    if (response.status.connectionError) throw NoConnectException();
    if (response.status.isNotFound) throw HttpFailException();
    if (response.status.code == 422) throw BadFormatException();
    if (response.status.hasError) throw GlobalException(response: response);
  }
}