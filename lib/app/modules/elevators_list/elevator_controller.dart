import 'package:get/get.dart';
import 'package:get/instance_manager.dart';

import 'elevator_service.dart';
import 'entity/elevator.dart';

class ElevatorListController extends GetxController {
  final service = Get.find<ElevatorListService>();

  var notOnlineElevatorsObs = <Elevator>[].obs;
  var elevatorStatusObs = "Not-Online".obs;

  @override
  void onInit() {
    getNotonlineElevators();
  }

  Future<String> updateElevatorStatus(String id) {
    return service
        .updateElevatorStatus(id)
        .then((elevatorStatus) {
      var index = notOnlineElevatorsObs.indexWhere((item) => item.id.toString() == id);
      notOnlineElevatorsObs.removeAt(index);
      elevatorStatusObs.value = elevatorStatus;
      return elevatorStatus;
    });

  }

  Future<List<Elevator>> getNotonlineElevators() {
    return service
        .getNotonlineElevators()
        .then((elevatorList) => notOnlineElevatorsObs.value = elevatorList);
  }
}