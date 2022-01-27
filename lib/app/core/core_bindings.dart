import 'package:flutter_01_alpha/app/core/exceptions/core_handler.dart';
import 'package:get/instance_manager.dart';

import 'properties.dart';
import 'text/labels.dart';
import 'text/message_labels.dart';
import 'utils/animations_utils.dart';

class CoreBindings extends Bindings {
  @override
  void dependencies() {
    // GENERAL-INJECTIONS
    Get.lazyPut(() => Properties());
    Get.lazyPut(() => MessageLabels());
    Get.lazyPut(() => Labels());
    Get.lazyPut(() => CoreHandler());
    Get.lazyPut(() => AnimationsUtils());
  }
}