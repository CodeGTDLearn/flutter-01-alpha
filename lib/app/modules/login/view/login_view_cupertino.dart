import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_01_alpha/app/core/properties.dart';
import 'package:flutter_01_alpha/app/core/text/labels.dart';
import 'package:flutter_01_alpha/app/modules/login/components/email_form_field/email_form_field_cupertino.dart';
import 'package:flutter_01_alpha/app/modules/login/components/login_button.dart';
import 'package:flutter_01_alpha/app/modules/login/login_controller.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';

class LoginViewCupertino extends StatelessWidget {
  final _labels = Get.find<Labels>();
  final _properties = Get.find<Properties>();
  final _controller = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height * 0.12;
    var width = MediaQuery.of(context).size.width * 0.25;
    return CupertinoPageScaffold(
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
                fit: FlexFit.tight,
                child: LoginButton().create(context, _controller, height, width)),
            const Spacer(flex: 1)
          ])),
        ));
  }
}