import 'package:get/instance_manager.dart';

import '../text/app_core_labels.dart';
import '../text/app_core_messages.dart';

class AppCoreLabelsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AppCoreMessages());
    Get.lazyPut(() => AppCoreLabels());
  }
}