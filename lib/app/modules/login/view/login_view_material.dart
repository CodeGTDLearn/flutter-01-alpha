import 'package:flutter/material.dart';
import 'package:flutter_01_alpha/app/core/message_labels.dart';
import 'package:flutter_01_alpha/app/core/properties.dart';
import 'package:flutter_01_alpha/app/core/routes.dart';
import 'package:flutter_01_alpha/app/modules/login/components/material_email_field.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';

import '../login_controller.dart';

class LoginViewMaterial extends StatefulWidget {
  @override
  _LoginViewMaterialState createState() => _LoginViewMaterialState();
}

class _LoginViewMaterialState extends State<LoginViewMaterial> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _properties = Get.find<Properties>();
  final _messages = Get.find<MessageLabels>();
  final _controller = Get.find<LoginController>();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text(_properties.appTitle),
        // centerTitle: true,
      ),
      body: Center(
          child: Column(children: [
        Flexible(
            fit: FlexFit.tight,
            child: Container(
                width: double.infinity,
                child: Image(image: AssetImage(_properties.appLogo)))),
        Flexible(
            fit: FlexFit.tight,
            child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                    padding: EdgeInsets.all(16),
                    child: MaterialEmailField(controller: _emailController)))),
        Flexible(
            fit: FlexFit.tight,
            child: Container(
                color: Colors.red,
                width: double.infinity,
                alignment: Alignment.center,
                child: InkWell(
                    child: const Image(image: AssetImage('assets/elevator-btn.png')),
                    onTap: () {
                      var checkEmail = _validateEmail(context, _formKey.currentState);
                      FocusScope.of(context).unfocus();
                      if (checkEmail) {
                                // @formatter:off
                                _controller
                                    .authentication(_emailController.text.trim())
                                    .then((value) =>
                                value
                                    ? Get.toNamed(Routes.ELEVATOR_LIST_URL)
                                    : Get.defaultDialog(
                                    title: _messages.opss_fail_title,
                                    middleText:_messages.auth_fail_content)
                                );
                        // @formatter:on
                      }
                    })))
      ])));

  bool _validateEmail(BuildContext context, FormState? formState) {
    final form = formState!;
    if (form.validate()) return true;
    return false;
  }
}