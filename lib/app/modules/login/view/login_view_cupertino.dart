import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_01_alpha/app/core/properties.dart';
import 'package:flutter_01_alpha/app/core/routes.dart';
import 'package:flutter_01_alpha/app/core/text/labels.dart';
import 'package:flutter_01_alpha/app/core/text/message_labels.dart';
import 'package:flutter_01_alpha/app/modules/login/components/email_form_field_cupertino.dart';
import 'package:flutter_01_alpha/app/modules/login/login_controller.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';

class LoginViewCupertino extends StatelessWidget {
  final _labels = Get.find<Labels>();
  final _properties = Get.find<Properties>();
  final _messages = Get.find<MessageLabels>();
  final _controller = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) => CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(middle: Text(_properties.appTitle)),
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromRGBO(240, 241, 247, 1),
      child: SafeArea(
        child: Center(
            child: Column(children: [
          Flexible(
              flex: 2,
              fit: FlexFit.tight,
              child: Container(
                  width: double.infinity,
                  child: Image(image: AssetImage(_properties.appLogo)))),
          Flexible(
              flex: 3,
              fit: FlexFit.tight,
              child: Center(
                  child: Form(
                      key: _controller.loginFormKey,
                      child: SingleChildScrollView(
                          padding: const EdgeInsets.all(16),
                          child: EmailFormFieldCupertino().field(
                            _controller,
                            hint: _labels.labelLoginFieldHint,
                            iconPrefix: Icons.mail,
                            // iconSufix: Icons.close,
                          ))))),
          Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                      onTap: () => _triggerButtonAction(context),
                      customBorder: const CircleBorder(),
                      child: Image(image: AssetImage(_properties.appLoginImgBtn)),
                      splashColor: Colors.grey))),
          const Spacer(flex: 1)
        ])),
      ));

  void _triggerButtonAction(BuildContext context) {
    var checkEmail = _controller.emailValidation(context);
    FocusScope.of(context).unfocus();
    if (checkEmail) {
      var checkEmail = _controller.emailValidation(context);
      FocusScope.of(context).unfocus();
      if (checkEmail) {
        _controller
            .authentication(_controller.emailController.text.trim())
            .then((value) => value
                ? Get.toNamed(Routes.ELEVATOR_LIST_URL)
                : Get.defaultDialog(
                    title: _labels.ops,
                    middleText: _messages.authFailContent,
                  ));
      }
    }
  }
}