import 'package:flutter_01_alpha/app/modules/elevators_list/components/custom_sliver_appbar.dart';
import 'package:flutter_01_alpha/app/modules/elevators_list/elevator_controller.dart';
import 'package:flutter_01_alpha/app/modules/elevators_list/elevator_list_repo.dart';
import 'package:flutter_01_alpha/app/modules/elevators_list/elevator_service.dart';
import 'package:get/instance_manager.dart';

import '../animations_utils.dart';
import '../labels.dart';
import '../message_labels.dart';
import '../properties.dart';

class ElevatorListBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Labels());
    Get.lazyPut(() => Properties());
    Get.lazyPut(() => MessageLabels());
    Get.lazyPut(() => AnimationsUtils());
    Get.lazyPut(() => CustomSliverAppBar());

    Get.lazyPut(() => ElevatorListRepo());
    Get.lazyPut(() => ElevatorListService());
    Get.lazyPut(() => ElevatorListController());
  }
}