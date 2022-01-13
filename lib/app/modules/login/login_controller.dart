import 'package:email_validator/email_validator.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_01_alpha/app/core/text/labels.dart';
import 'package:flutter_01_alpha/app/core/text/message_labels.dart';
import 'package:flutter_01_alpha/app/modules/login/login_service.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';

class LoginController extends GetxController {
  final service = Get.find<LoginService>();
  final loginFormKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final _messages = Get.find<MessageLabels>();
  final _labels = Get.find<Labels>();


  @override
  void onInit() {
    // Simulating obtaining the user name
    // from some local storage
    // emailController.text = _labels.labelLoginField;
    super.onInit();
  }


  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }

  String? emailValidator(String? email) {
    if (email != null && !EmailValidator.validate(email)) {
      return _messages.emailFormatField;
    }
    return null;
  }

  bool emailValidation(BuildContext context) {
    final form = loginFormKey.currentState!;
    if (form.validate()) return true;
    return false;
  }

  Future<bool> authentication(String email) {
    return service.authentication(email);
  }

  void loginStatusSnackbar() {
    if (loginFormKey.currentState!.validate()) {
      authentication(emailController.text).then((auth) {
        if (auth) {
          Get.snackbar(_labels.sucess, _messages.emailLoginSucess);
        } else {
          Get.snackbar(_labels.ops, _messages.emailFormatField);
        }
        emailController.clear();
      });
    }
  }
}