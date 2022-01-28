import 'package:flutter_01_alpha/app/core/exceptions/global_exceptions_handler.dart';
import 'package:get/instance_manager.dart';


class GlobalExceptionsHandlerBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GlobalExceptionsHandler());
  }
}