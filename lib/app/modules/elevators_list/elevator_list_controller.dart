import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';

import 'elevator_list_service.dart';
import 'entity/elevator.dart';

class ElevatorListController extends GetxController {
  final _service = Get.find<ElevatorListService>();

  var _notOnlineStatusObs = <Elevator>[].obs;

  var _buttonLabelStatusObs = "Not-Online".obs;
  var _buttonColorObs = Colors.red.obs;
  var _buttonShadowBlurObs = 15.0.obs;
  var _buttonScaleObs = false.obs;

  var neum_isActiveObs = false.obs;

  @override
  void onInit() {
    getNotonlineElevators();
  }

  Future<String> updateElevatorStatus(String id) {
    return _service.updateElevatorStatus(id).then((elevatorStatus) {
      if (elevatorStatus == 'online') {
        var index = _notOnlineStatusObs.indexWhere((item) => item.id.toString() == id);
        _notOnlineStatusObs.removeAt(index);
        buttonLabelStatusObs.value = elevatorStatus;
        return elevatorStatus;
      }
      return elevatorStatus;
    });
  }

  Future<List<Elevator>> getNotonlineElevators() {
    return _service
        .getNotonlineElevators()
        .then((elevatorList) => _notOnlineStatusObs.value = elevatorList);
  }

  void elevatorStatusButtonAnimation(
      {required MaterialColor color, required double blur}) {
    _buttonColorObs.value = color;
    _buttonShadowBlurObs.value = blur;
    _buttonScaleObs.value = !_buttonScaleObs.value;
  }

  get buttonColorObs => _buttonColorObs;

  get buttonShadowBlurObs => _buttonShadowBlurObs;

  get buttonLabelStatusObs => _buttonLabelStatusObs;

  get buttonScaleObs => _buttonScaleObs;

  get notOnlineStatusObs => _notOnlineStatusObs;
}