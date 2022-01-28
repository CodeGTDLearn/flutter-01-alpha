import 'package:flutter_01_alpha/app/core/components/modal/i_adaptive_modal.dart';
import 'package:flutter_01_alpha/app/core/components/modal/app_core_modal_cupertino.dart';
import 'package:flutter_01_alpha/app/core/components/modal/app_core_modal_material.dart';
import 'package:flutter_01_alpha/app/modules/login/login_controller.dart';
import 'package:flutter_01_alpha/app/modules/login/login_service.dart';
import 'package:flutter_01_alpha/app/modules/login/repo/i_login_repo.dart';
import 'package:flutter_01_alpha/app/modules/login/repo/login_repo_getx.dart';
import 'package:get/instance_manager.dart';


class LoginBindings extends Bindings {
  @override
  void dependencies() {
    // ADAPTIVE-ELEMENTS
    Get.lazyPut<IAdaptiveModal>(() => (AppCoreModalMaterial()), tag: 'android');
    Get.lazyPut<IAdaptiveModal>(() => (AppCoreModalCupertino()), tag: 'ios');

    // MVC-LAYERS
    // Get.lazyPut<ILoginRepo>(() => (LoginRepoHttp()));
    Get.lazyPut<ILoginRepo>(() => (LoginRepoGetx()));
    Get.lazyPut(() => LoginService());
    Get.lazyPut(() => LoginController());
  }
}