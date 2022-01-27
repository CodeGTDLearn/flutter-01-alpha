import 'package:flutter_01_alpha/app/core/properties.dart';
import 'package:flutter_01_alpha/app/modules/elevators_list/core/exceptions/elevator_list_exception_handler.dart';
import 'package:get/get_connect.dart';
import 'package:get/instance_manager.dart';

import '../entity/elevator.dart';
import 'i_elevator_list_repo.dart';

class ElevatorListRepoGetx extends GetConnect implements IElevatorListRepo {
  final _properties = Get.find<Properties>();
  final _exceptions = Get.find<ElevatorListExceptionHandler>();

  @override
  void onInit() {
    httpClient
          ..baseUrl = _properties.apiRootUrl
          ..defaultContentType = "application/json"
          ..timeout = const Duration(seconds: 8)
        // ..errorSafety = false // send the exception to the service
        ;
    super.onInit();
  }

  @override
  Future<String> updateElevatorStatus(String id) {
    // api/elevators/{id}/online
    var url = "${_properties.updateEndp}$id/online";
    Map body = {"status": "status"};

    // @formatter:off
    return put(url, body)
           .then((response) {
             _exceptions.updateElevatorStatus(response);
             return response.status.isOk
                    ? Future.value("online")
                    : Future.value("offline");
           });
    // @formatter:on
  }

  @override
  Future<List<Elevator>> getNotonlineElevators() {
    // @formatter:off
    return get(_properties.notOnlineElevatorsEndp)
           .then((response){
                _exceptions.getNotonlineElevators(response);
                return response
                      .body
                      .map<Elevator>((resp) => Elevator.fromJson(resp))
                      .toList();
            });
    // @formatter:on
  }
}