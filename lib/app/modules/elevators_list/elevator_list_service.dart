import 'dart:io';

import 'package:flutter_01_alpha/app/core/components/modal/i_adaptive_modal.dart';
import 'package:flutter_01_alpha/app/core/text/labels.dart';
import 'package:flutter_01_alpha/app/core/text/message_labels.dart';
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