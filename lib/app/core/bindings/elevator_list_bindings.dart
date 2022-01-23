import 'package:flutter_01_alpha/app/core/components/modal/i_adaptive_modal.dart';
import 'package:flutter_01_alpha/app/core/components/modal/modal_cupertino.dart';
import 'package:flutter_01_alpha/app/core/components/modal/modal_material.dart';
import 'package:flutter_01_alpha/app/modules/elevators_list/components/animated_list_tile/animated_tile_cupertino.dart';
import 'package:flutter_01_alpha/app/modules/elevators_list/components/animated_list_tile/animated_tile_material.dart';
import 'package:flutter_01_alpha/app/modules/elevators_list/components/animated_list_tile/i_animated_tile.dart';
import 'package:flutter_01_alpha/app/modules/elevators_list/components/sliver_appbar/i_sliver_appbar.dart';
import 'package:flutter_01_alpha/app/modules/elevators_list/components/sliver_appbar/sliver_appbar_cupertino.dart';
import 'package:flutter_01_alpha/app/modules/elevators_list/components/sliver_appbar/sliver_appbar_material.dart';
import 'package:flutter_01_alpha/app/modules/elevators_list/elevator_list_controller.dart';
import 'package:flutter_01_alpha/app/modules/elevators_list/repo/elevator_list_repo_getx.dart';
import 'package:flutter_01_alpha/app/modules/elevators_list/repo/elevator_list_repo_http.dart';
import 'package:flutter_01_alpha/app/modules/elevators_list/elevator_list_service.dart';
import 'package:flutter_01_alpha/app/modules/elevators_list/repo/i_elevator_list_repo.dart';
import 'package:get/instance_manager.dart';

import '../properties.dart';
import '../text/labels.dart';
import '../text/message_labels.dart';
import '../utils/animations_utils.dart';

class ElevatorListBindings extends Bindings {
  @override
  void dependencies() {

    // GENERAL-INJECTIONS
    Get.lazyPut(() => Labels());
    Get.lazyPut(() => Properties());
    Get.lazyPut(() => MessageLabels());
    Get.lazyPut(() => AnimationsUtils());

    // ADAPTIVE-ELEMENTS
    Get.lazyPut<IAdaptiveModal>(() => (ModalMaterial()), tag: 'android');
    Get.lazyPut<IAdaptiveModal>(() => (ModalCupertino()), tag: 'ios');
    Get.lazyPut<IAnimatedListTile>(() => (AnimatedTileMaterial()), tag: 'android');
    Get.lazyPut<IAnimatedListTile>(() => (AnimatedTileCupertino()), tag: 'ios');
    Get.lazyPut<ISliverAppBar>(() => (SliverAppBarMaterial()), tag: 'android');
    Get.lazyPut<ISliverAppBar>(() => (SliverAppBarCupertino()), tag: 'ios');

    // MVC-LAYERS
    // Get.lazyPut<IElevatorListRepo>(() => (ElevatorListRepoHttp()));
    Get.lazyPut<IElevatorListRepo>(() => (ElevatorListRepoGetx()));
    Get.lazyPut(() => ElevatorListRepoHttp());
    Get.lazyPut(() => ElevatorListService());
    Get.lazyPut(() => ElevatorListController());
  }
}