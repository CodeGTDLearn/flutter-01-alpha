import 'dart:convert';

import 'package:flutter_01_alpha/app/core/exceptions/global_exceptions_handler.dart';
import 'package:get/get_connect/connect.dart';

import 'types/get_notonline_elevators_exception.dart';
import 'types/update_elevator_status_exception.dart';

class ElevatorListExceptionHandler extends GlobalExceptionsHandler {

  void getNotonlineElevators(Response<dynamic> response) {
    /* JSON-EXCEPTION-SCANNED
    {
      "type": "https://tools.ietf.org/html/rfc7231#section-6.5.1",
      "title": "One or more validation errors occurred.",
      "status": 400,
      "traceId": "00-2bd3f397174aa04bbcfa7acd36a17c5e-d92a081cad8a7b41-00",
      "errors": {
        "id": [
          "The value 'NotOnlinexx' is not valid."
        ]
      }
    }
     */
    if(response.hasError) {
      super.coreScan(response);
      Map<String, dynamic> responseJson = json.decode(response.body);
      var error = responseJson["errors"]["id"][0];
      var title = responseJson["title"];
      throw GetNotonlineElevatorsException(title, error);
    }
  }

  void updateElevatorStatus(Response<dynamic> response) {
    /* JSON-EXCEPTION-SCANNED
    {
      "type": "https://tools.ietf.org/html/rfc7231#section-6.5.1",
      "title": "One or more validation errors occurred.",
      "status": 400,
      "traceId": "00-2bd3f397174aa04bbcfa7acd36a17c5e-d92a081cad8a7b41-00",
      "errors": {
        "": [
          "A non-empty request body is required."
        ]
      }
    }
     */
    if(response.hasError) {
      super.coreScan(response);
      Map<String, dynamic> responseJson = json.decode(response.body);
      var error = responseJson["errors"][""][0];
      var title = responseJson["title"];
      throw UpdateElevatorStatusException(title, error);
    }
  }
}