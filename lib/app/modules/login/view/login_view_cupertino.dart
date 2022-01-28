import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_01_alpha/app/core/platforms/cupertino_styles.dart';
import 'package:flutter_01_alpha/app/core/properties/app_core_properties.dart';
import 'package:flutter_01_alpha/app/core/properties/app_core_image_properties.dart';
import 'package:flutter_01_alpha/app/core/text/app_core_labels.dart';
import 'package:flutter_01_alpha/app/modules/login/core/components/email_form_field/email_form_field_cupertino.dart';
import 'package:flutter_01_alpha/app/modules/login/core/components/login_button.dart';
import 'package:flutter_01_alpha/app/modules/login/login_controller.dart';
import 'package:get/instance_manager.dart';

class LoginViewCupertino extends StatelessWidget {
  final _labels = Get.find<AppCoreLabels>();
  final _generalProps = Get.find<AppCoreProperties>();
  final _imageProps = Get.find<AppCoreImageProperties>();
  final _controller = Get.find<LoginController>();
  final _platform = Platform.operatingSystem;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height * 0.12;
    var width = MediaQuery.of(context).size.width * 0.25;
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(middle: Text('${_generalProps
            .appTitle}|View: $_platform')),
        resizeToAvoidBottomInset: false,
        // backgroundColor: const Color.fromRGBO(240, 241, 247, 1),
        backgroundColor: CupertinoStyles.scaffoldColor,
        child: SafeArea(
          child: Center(
              child: Column(children: [
            Flexible(
                flex: 2,
                fit: FlexFit.tight,
                child: Container(
                    width: double.infinity,
                    child: Image(image: AssetImage(_imageProps.appLogo)))),
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
                              iconPrefix: CupertinoIcons.mail,
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