import 'dart:io';

import 'package:flutter_01_alpha/app/core/exceptions/bad_format_exception.dart';
import 'package:flutter_01_alpha/app/core/exceptions/htttp_fail_exception.dart';
import 'package:flutter_01_alpha/app/core/exceptions/no_connection_exception.dart';
import 'package:flutter_01_alpha/app/core/properties.dart';
import 'package:get/get_connect.dart';
import 'package:get/instance_manager.dart';

import '../entity/elevator.dart';
import 'i_elevator_list_repo.dart';

class ElevatorListRepoGetx extends GetConnect implements IElevatorListRepo {
  final _properties = Get.find<Properties>();

  @override
  void onInit() {
    httpClient.baseUrl = _properties.apiRootUrl;
    httpClient.defaultContentType = "application/json";
    httpClient.timeout = const Duration(seconds: 8);
    // httpClient.errorSafety = false; // send the exception to the service
    super.onInit();
  }

  @override
  Future<String> updateElevatorStatus(String id) {
    // api/elevators/{id}/online
    var url = "${_properties.updateEndp}$id/online";
    Map body = {"status": "status"};

    // @formatter:off
    var then = put(url, body)
               .then((response) {
                 // if(response.hasError) _exceptions(response);
                 if (response.statusCode == 200) return Future.value("online");
                 // if (response.statusCode >= 400) return "error";
                 return Future.value("offline");
               });

    return then;
    // @formatter:on
  }

  @override
  Future<List<Elevator>> getNotonlineElevators() {
    // @formatter:off
    return get(_properties.notOnlineElevatorsEndp)
          .then((response)
           {
             // print(response.toString());
             // if(response.hasError is HttpException) throw HttpFailException;
             // if(response.hasError is SocketException) throw NoConnectException;
             // if(response.hasError is FormatException) throw BadFormatException;
             return response
                     .body
                     .map<Elevator>((resp) => Elevator.fromJson(resp))
                     .toList();
           });
    // @formatter:on
  }

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