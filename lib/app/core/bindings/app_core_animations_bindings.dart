import 'package:flutter_01_alpha/app/core/utils/app_core_animations_utils.dart';
import 'package:get/instance_manager.dart';


class AppCoreAnimationsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AppCoreAnimationsUtils());
  }
}