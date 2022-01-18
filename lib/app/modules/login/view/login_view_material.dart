import 'package:flutter/material.dart';
import 'package:flutter_01_alpha/app/core/properties.dart';
import 'package:flutter_01_alpha/app/core/routes.dart';
import 'package:flutter_01_alpha/app/core/text/labels.dart';
import 'package:flutter_01_alpha/app/core/text/message_labels.dart';
import 'package:flutter_01_alpha/app/modules/login/components/email_form_field_material.dart';
import 'package:flutter_01_alpha/app/modules/login/login_controller.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';

class LoginViewMaterial extends StatelessWidget {
  final _labels = Get.find<Labels>();
  final _properties = Get.find<Properties>();
  final _messages = Get.find<MessageLabels>();
  final _controller = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(title: Text(_properties.appTitle)),
      body: SafeArea(
          child: Center(
              child: Column(children: [
        Flexible(
            fit: FlexFit.tight,
            child: Container(
                width: double.infinity,
                child: Image(image: AssetImage(_properties.appLogo)))),
        Flexible(
            fit: FlexFit.tight,
            child: Form(
                key: _controller.loginFormKey,
                child: SingleChildScrollView(
                    padding: EdgeInsets.all(16),
                    child: EmailFormFieldMaterial().field(
                      _controller,
                      hint: _labels.labelLoginFieldHint,
                      iconPrefix: Icons.mail,
                      iconSufix: Icons.close,
                    )))),
        Flexible(
            fit: FlexFit.tight,
            child: Container(
                color: Colors.transparent,
                width: double.infinity,
                alignment: Alignment.center,
                child: InkWell(
                    child: Obx(
                      () => AnimatedContainer(
                        alignment: Alignment.center,
                        curve: Curves.ease,
                        duration: Duration(milliseconds: 1000),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: Image(image: AssetImage(_properties.appLoginImgBtn))
                            ,//<<<<<<<< erro
                            // borderRadius: BorderRadius.all(Radius.circular(100)),
                            // shape: BoxShape.rectangle,
                            // color: _controller.buttonColorObs.value,
                            // border: Border.all(color: Colors.grey),
                            // borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                  color: _controller.buttonColorObs.value,
                                  blurRadius: _controller.buttonShadowBlurObs.value)
                            ]),
                        // child: Image(image: AssetImage(_properties.appLoginImgBtn)),
                      ),
                    ),
                    onTap: () => _triggerButtonAction(context))))
      ]))));

  void _triggerButtonAction(BuildContext context) {
    // @formatter:off
    _controller.elevatorButtonAnimation(color: Colors.grey,blur: 30);
    var checkEmail = _controller.emailValidation(context);
    FocusScope.of(context).unfocus();
    if (checkEmail) {
       _controller
           .authentication(_controller.emailController.text.trim())
           .then((value) => value
                      ? Get.toNamed(Routes.ELEVATOR_LIST_URL)
                      : Get.defaultDialog(
                      title: _labels.ops,
                      middleText:_messages.authFailContent)
       );
    }
    // @formatter:on
  }
}