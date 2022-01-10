import 'package:flutter_01_alpha/app/core/components/adaptive_button.dart';
import 'package:flutter_01_alpha/app/modules/home/components/view_button.dart';
import 'package:flutter_01_alpha/app/modules/home/components/view_label.dart';
import 'package:flutter_01_alpha/app/modules/home/controller/home_controller.dart';
import 'package:flutter_01_alpha/app/modules/home/repo/home_repo.dart';
import 'package:flutter_01_alpha/app/modules/home/service/home_service.dart';
import 'package:get/instance_manager.dart';

import '../properties.dart';

class HomeBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>ViewButton());
    Get.lazyPut(() => ViewLabel());
    Get.lazyPut(() => Properties());
    Get.lazyPut(()=>AdaptiveButton());
    Get.lazyPut(() => HomeRepo());
    Get.lazyPut(() => HomeService());
    Get.lazyPut(() => HomeController());
  }
}