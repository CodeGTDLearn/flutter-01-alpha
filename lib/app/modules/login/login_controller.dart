// ignore_for_file: prefer_final_fields


import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_01_alpha/app/core/properties/app_core_delay_properties.dart';
import 'package:flutter_01_alpha/app/core/routes/views_routes.dart';
import 'package:flutter_01_alpha/app/core/text/app_core_labels.dart';
import 'package:flutter_01_alpha/app/core/text/app_core_messages.dart';
import 'package:flutter_01_alpha/app/modules/login/login_service.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';

class LoginController extends GetxController {
  final _service = Get.find<LoginService>();
  final _loginFormKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _messages = Get.find<AppCoreMessages>();
  final _labels = Get.find<AppCoreLabels>();
  final _properties = Get.find<AppCoreDelayProperties>();

  var _buttonColorObs = Colors.orange.obs;
  var _buttonShadowBlurObs = 30.0.obs;
  var _buttonScaleObs = false.obs;


  @override
  void onInit() {
    _emailController.text = "nicolas.genest@codeboxx.biz";
    super.onInit();
  }

  @override
  void onClose() {
    _emailController.dispose();
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

  void loginButtonAnimation(
      {required MaterialColor color, required double blur}) {
    _buttonColorObs.value = color;
    _buttonShadowBlurObs.value = blur;
    _buttonScaleObs.value = !_buttonScaleObs.value;
  }

  Future<bool> authentication(String email) => _service.authentication(email);

  void loginStatusSnackbar() {
    var valid = loginFormKey.currentState!.validate();
    authentication(_emailController.text).then((auth) {
      if (valid && auth) Get.snackbar(_labels.sucess, _messages.emailLoginSucess);
      if (valid && !auth) Get.snackbar(_labels.ops, _messages.emailFormatField);
      _emailController.clear();
    });
  }

  void loginButtonAction(BuildContext context) {
    // @formatter:off
    var isValidEmail = emailValidation(context);
    loginButtonAnimation(color: Colors.orange,blur: 0);

    Future
        .delayed(Duration(milliseconds: _properties.delayStatusElevator))
        .whenComplete(()
        {
          if(!isValidEmail) loginButtonAnimation(color: Colors.red,blur: 30);
          FocusScope.of(context).unfocus();
          if (isValidEmail) {
             authentication(emailController.text.trim())
             .then((isAuthenticed) => isAuthenticed
              ? () {
                    loginButtonAnimation(color: Colors.green,blur: 30);
                    Future
                        .delayed(Duration(milliseconds: _properties
                        .delayStatusElevator))
                        .whenComplete(() => Get.toNamed(ViewsRoutes.ELEVATOR_LIST_URL));
                  }.call()
              : () {
                  loginButtonAnimation(color: Colors.red,blur: 30);
                  Get.defaultDialog(title: _labels.ops, middleText:_messages
                   .authFailContent);
                  }.call())
          ;
         }
       });
    // @formatter:on
  }

  get buttonShadowBlurObs => _buttonShadowBlurObs;

  get buttonColorObs => _buttonColorObs;

  get loginFormKey => _loginFormKey;

  get emailController => _emailController;

  get buttonScaleObs => _buttonScaleObs;


}