import 'package:flutter_01_alpha/app/core/components/modal/i_adaptive_modal.dart';
import 'package:flutter_01_alpha/app/core/components/modal/modal_cupertino.dart';
import 'package:flutter_01_alpha/app/core/components/modal/modal_material.dart';
import 'package:flutter_01_alpha/app/modules/login/login_controller.dart';
import 'package:flutter_01_alpha/app/modules/login/repo/i_login_repo.dart';
import 'package:flutter_01_alpha/app/modules/login/repo/login_repo_getx.dart';
import 'package:flutter_01_alpha/app/modules/login/login_service.dart';
import 'package:get/instance_manager.dart';

import '../properties.dart';
import '../text/labels.dart';
import '../text/message_labels.dart';

class LoginBindings extends Bindings {
  @override
  void dependencies() {

    // GENERAL-INJECTIONS
    Get.lazyPut(() => Properties());
    Get.lazyPut(() => MessageLabels());
    Get.lazyPut(() => Labels());

    // ADAPTIVE-ELEMENTS
    Get.lazyPut<IAdaptiveModal>(() => (ModalMaterial()), tag: 'android');
    Get.lazyPut<IAdaptiveModal>(() => (ModalCupertino()), tag: 'ios');

    // MVC-LAYERS
    // Get.lazyPut<ILoginRepo>(() => (LoginRepoHttp()));
    Get.lazyPut<ILoginRepo>(() => (LoginRepoGetx()));
    Get.lazyPut(() => LoginService());
    Get.lazyPut(() => LoginController());
  }
}