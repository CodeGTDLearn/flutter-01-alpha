import 'package:flutter_01_alpha/app/core/bindings/app_core_properties_bindings.dart';
import 'package:get/instance_manager.dart';

import 'app_core_animations_bindings.dart';
import 'global_exceptions_handler_bindings.dart';
import 'app_core_labels_bindings.dart';

class AppCoreBindings extends Bindings {
  @override
  void dependencies() {
    GlobalExceptionsHandlerBindings().dependencies();
    AppCoreAnimationsBindings().dependencies();
    AppCoreLabelsBindings().dependencies();
    AppCorePropertiesBindings().dependencies();
  }
}