import 'package:flutter_01_alpha/app/modules/login/login_controller.dart';
import 'package:flutter_01_alpha/app/modules/login/login_repo.dart';
import 'package:flutter_01_alpha/app/modules/login/login_service.dart';
import 'package:get/instance_manager.dart';

import '../message_labels.dart';
import '../properties.dart';

class LoginBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Properties());

    Get.lazyPut(() => MessageLabels());
    Get.lazyPut(() => LoginRepo());
    Get.lazyPut(() => LoginService());
    Get.lazyPut(() => LoginController());
  }
}