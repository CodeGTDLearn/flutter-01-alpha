import 'package:flutter_01_alpha/app/core/components/modal/i_adaptive_modal.dart';
import 'package:flutter_01_alpha/app/core/components/modal/modal_cupertino.dart';
import 'package:flutter_01_alpha/app/core/components/modal/modal_material.dart';
import 'package:flutter_01_alpha/app/modules/login/login_controller.dart';
import 'package:flutter_01_alpha/app/modules/login/login_repo.dart';
import 'package:flutter_01_alpha/app/modules/login/login_service.dart';
import 'package:get/instance_manager.dart';

import '../properties.dart';
import '../text/labels.dart';
import '../text/message_labels.dart';

class LoginBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Properties());
    Get.lazyPut(() => MessageLabels());
    Get.lazyPut(() => Labels());
    Get.lazyPut<IAdaptiveModal>(() => (ModalMaterial()), tag: 'android');
    Get.lazyPut<IAdaptiveModal>(() => (ModalCupertino()), tag: 'ios');
    Get.lazyPut(() => LoginRepo());
    Get.lazyPut(() => LoginService());
    Get.lazyPut(() => LoginController());
  }
}