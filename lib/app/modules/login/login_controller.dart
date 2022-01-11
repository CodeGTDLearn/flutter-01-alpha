import 'package:flutter_01_alpha/app/modules/login/login_service.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';

class LoginController extends GetxController {
  final service = Get.find<LoginService>();

  Future<bool> authentication(String email) {
    return service.authentication(email);
  }
}