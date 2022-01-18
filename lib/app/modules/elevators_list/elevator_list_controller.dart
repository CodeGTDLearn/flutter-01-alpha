import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';

import 'elevator_list_service.dart';
import 'entity/elevator.dart';

class ElevatorListController extends GetxController {
  final service = Get.find<ElevatorListService>();

  var notOnlineElevatorsObs = <Elevator>[].obs;
  //
  var buttonColorObs = Colors.red.obs;
  var buttonShadowBlurObs = 0.0.obs;
  var buttonLabelStatusObs = "Not-Online".obs;

  var neum_isActiveObs = false.obs;

  @override
  void onInit() {
    getNotonlineElevators();
  }

  Future<String> updateElevatorStatus(String id) {
    return service.updateElevatorStatus(id).then((elevatorStatus) {
      if (elevatorStatus == 'online') {
        var index = notOnlineElevatorsObs.indexWhere((item) => item.id.toString() == id);
        notOnlineElevatorsObs.removeAt(index);
        buttonLabelStatusObs.value = elevatorStatus;
        return elevatorStatus;
      }
      return elevatorStatus;
    });
  }

  Future<List<Elevator>> getNotonlineElevators() {
    return service
        .getNotonlineElevators()
        .then((elevatorList) => notOnlineElevatorsObs.value = elevatorList);
  }

  void elevatorStatusButtonAnimation({required MaterialColor color, required double blur}) {
    buttonColorObs.value = color;
    buttonShadowBlurObs.value = blur;
  }
}