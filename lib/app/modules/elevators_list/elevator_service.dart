import 'package:get/instance_manager.dart';

import 'elevator_list_repo.dart';
import 'entity/elevator.dart';

class ElevatorListService {
  final repo = Get.find<ElevatorListRepo>();

  Future<String> updateElevatorStatus(String id) {
    return repo.updateElevatorStatus(id);
  }

  Future<List<Elevator>> getNotonlineElevators() {
    return repo.getNotonlineElevators();
  }
}