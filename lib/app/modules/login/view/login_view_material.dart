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
                  color: Colors.red,
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: InkWell(
                      child: const Image(image: AssetImage('assets/elevator-btn.png')),
                      onTap: () {
                        // @formatter:off
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
                      })))
        ])),
      ));
}