import 'package:flutter_01_alpha/app/modules/home/service/home_service.dart';
import 'package:get/state_manager.dart';
import 'package:get/instance_manager.dart';

class HomeController extends GetxController {
  final service = Get.find<HomeService>();

  var showContagemNaTelaObs = 0.obs;

  void alteraContagemNaTela() {
    showContagemNaTelaObs.value =
        service.post_valorDoContador(showContagemNaTelaObs.value);
  }
}