import 'package:flutter_01_alpha/app/core/components/modal/i_adaptive_modal.dart';
import 'package:flutter_01_alpha/app/core/components/modal/modal_cupertino.dart';
import 'package:flutter_01_alpha/app/core/components/modal/modal_material.dart';
import 'package:flutter_01_alpha/app/modules/elevators_list/components/animated_list_tile/animated_tile_cupertino.dart';
import 'package:flutter_01_alpha/app/modules/elevators_list/components/animated_list_tile/animated_tile_material.dart';
import 'package:flutter_01_alpha/app/modules/elevators_list/components/animated_list_tile/i_animated_tile.dart';
import 'package:flutter_01_alpha/app/modules/elevators_list/components/multi_sliver_appbar/i_adaptive_sliver_appbar.dart';
import 'package:flutter_01_alpha/app/modules/elevators_list/components/multi_sliver_appbar/sliver_appbar_cupertino.dart';
import 'package:flutter_01_alpha/app/modules/elevators_list/components/multi_sliver_appbar/sliver_appbar_material.dart';
import 'package:flutter_01_alpha/app/modules/elevators_list/elevator_list_controller.dart';
import 'package:flutter_01_alpha/app/modules/elevators_list/elevator_list_repo.dart';
import 'package:flutter_01_alpha/app/modules/elevators_list/elevator_list_service.dart';
import 'package:get/instance_manager.dart';

import '../properties.dart';
import '../text/labels.dart';
import '../text/message_labels.dart';
import '../utils/animations_utils.dart';

class ElevatorListBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Labels());
    Get.lazyPut(() => Properties());
    Get.lazyPut(() => MessageLabels());
    Get.lazyPut(() => AnimationsUtils());
    Get.lazyPut<IAdaptiveModal>(() => (ModalMaterial()), tag: 'android');
    Get.lazyPut<IAdaptiveModal>(() => (ModalCupertino()), tag: 'ios');
    Get.lazyPut<IAnimatedListTile>(() => (AnimatedTileMaterial()), tag: 'android');
    Get.lazyPut<IAnimatedListTile>(() => (AnimatedTileCupertino()), tag: 'ios');
    Get.lazyPut<IAdaptiveSliverAppBar>(() => (SliverAppBarMaterial()), tag: 'android');
    Get.lazyPut<IAdaptiveSliverAppBar>(() => (SliverAppBarCupertino()), tag: 'ios');

    Get.lazyPut(() => ElevatorListRepo());
    Get.lazyPut(() => ElevatorListService());
    Get.lazyPut(() => ElevatorListController());
  }
}