
import 'package:get/instance_manager.dart';

import 'repo/elevator_list_repo_http.dart';
import 'entity/elevator.dart';
import 'repo/i_elevator_list_repo.dart';

class ElevatorListService {
  final repo = Get.find<IElevatorListRepo>();

  Future<String> updateElevatorStatus(String id) {
    return repo.updateElevatorStatus(id);
  }

  Future<List<Elevator>> getNotonlineElevators() {
    return repo.getNotonlineElevators();
  }

}