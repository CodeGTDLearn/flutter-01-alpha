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
    super.onInit();
  }
  // headers: {
  //   "content-type" : "application/json",
  // "accept" : "application/json",
  // }

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
             // if(response.hasError) _exceptions(response);
             return response
                     .body
                     .map<Elevator>((resp) => Elevator.fromJson(resp))
                     .toList();
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