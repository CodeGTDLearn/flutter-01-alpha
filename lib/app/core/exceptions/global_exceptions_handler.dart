import 'package:get/get_connect/connect.dart';

import 'types/bad_format_exception.dart';
import 'types/general_exception.dart';
import 'types/http_fail_exception.dart';
import 'types/no_authenticated_exception.dart';
import 'types/no_connection_exception.dart';

class GlobalExceptionsHandler {
  void coreScan(Response response) {
    if (response.hasError) {
      if (response.status.isUnauthorized) throw NoAuthenticatedException();
      if (response.status.isServerError) throw NoConnectException();
      if (response.status.connectionError) throw NoConnectException();
      if (response.status.isNotFound) throw HttpFailException();
      if (response.status.code == 422) throw BadFormatException();
      if (response.status.code != 400) throw GeneralException(response);
      // se o erro nao for um desses, ele da uma tela pro usuario, e mando stack trace
      // pro uma collection/area de log no DB/firebase
    }
  }
}