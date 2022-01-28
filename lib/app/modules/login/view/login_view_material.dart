import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_01_alpha/app/core/properties/app_core_properties.dart';
import 'package:flutter_01_alpha/app/core/properties/app_core_image_properties.dart';
import 'package:flutter_01_alpha/app/core/text/app_core_labels.dart';
import 'package:flutter_01_alpha/app/modules/login/core/components/email_form_field/email_form_field_material.dart';
import 'package:flutter_01_alpha/app/modules/login/core/components/login_button.dart';
import 'package:flutter_01_alpha/app/modules/login/login_controller.dart';
import 'package:get/instance_manager.dart';

class LoginViewMaterial extends StatelessWidget {
  final _labels = Get.find<AppCoreLabels>();
  final _generalProps = Get.find<AppCoreProperties>();
  final _imageProps = Get.find<AppCoreImageProperties>();
  final _controller = Get.find<LoginController>();
  final _platform = Platform.operatingSystem;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height * 0.12;
    var width = MediaQuery.of(context).size.width * 0.25;
    return Scaffold(
        appBar: AppBar(title: Text('${_generalProps.appTitle}|View: $_platform')),
        body: SafeArea(
            child: Center(
                child: Column(children: [
          Flexible(
              fit: FlexFit.tight,
              child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Image(image: AssetImage(_imageProps.appLogo)))),
          Flexible(
              fit: FlexFit.tight,
              child: Form(
                  key: _controller.loginFormKey,
                  child: SingleChildScrollView(
                      padding: const EdgeInsets.all(16),
                      child: EmailFormFieldMaterial().field(_controller,
                          hint: _labels.labelLoginFieldHint,
                          iconPrefix: Icons.mail,
                          iconSufix: Icons.close)))),
          Flexible(
              fit: FlexFit.tight,
              child: LoginButton().create(context, _controller, height, width))
        ]))));
  }
}