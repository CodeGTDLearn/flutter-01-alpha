import 'package:flutter/widgets.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/instance_manager.dart';

import 'entity/elevator.dart';
import 'repo/i_elevator_list_repo.dart';

class ElevatorListService {
  final repo = Get.find<IElevatorListRepo>();

  Future<String> updateElevatorStatus(String id) {
    // @formatter:off
    return repo
            .updateElevatorStatus(id)
            .catchError((onError) {
               Get.defaultDialog(content: Text(onError.toString()));
               return 'fail';});
    // @formatter:on
  }

  Future<List<Elevator>> getNotonlineElevators() {
    // @formatter:off
    return repo
            .getNotonlineElevators()
            .catchError((onError) {
              Get.defaultDialog(content: Text(onError.toString()));
              return <Elevator>[];});
    // @formatter:on
  }
}