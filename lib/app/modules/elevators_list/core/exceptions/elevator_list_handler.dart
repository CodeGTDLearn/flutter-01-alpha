import 'dart:convert';

import 'package:flutter_01_alpha/app/core/exceptions/core_handler.dart';
import 'package:get/get_connect/connect.dart';

import 'types/get_notonline_elevators_exception.dart';

class ElevatorListHandler extends CoreHandler {
  void scan(Response response) {
    var hasError = response.status.hasError;
    if(hasError) {
      super.coreScan(response);
      _getNotonlineElevatorsHandler(response);
    }
  }

  void _getNotonlineElevatorsHandler(Response<dynamic> response) {
    /* JSON-SCANNED
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
    Map<String, dynamic> responseJson = json.decode(response.body);
    var error = responseJson["errors"]["id"][0];
    var title = responseJson["title"];
    throw GetNotonlineElevatorsException(title,error);
  }
}