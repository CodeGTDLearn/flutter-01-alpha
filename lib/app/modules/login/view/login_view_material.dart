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
        Flexible(fit: FlexFit.tight, child: _loginButton(context))
      ]))));

  Container _loginButton(BuildContext context) {
    var _responsiveHeight = MediaQuery.of(context).size.height * 0.12;
    var _responsiveWidth = MediaQuery.of(context).size.width * 0.25;
    return Container(
        // color: Colors.green,
        width: double.infinity,
        alignment: Alignment.center,
        child: GestureDetector(
            child: Obx(
              () => AnimatedContainer(
                duration: const Duration(milliseconds: 750),
                alignment: Alignment.center,
                curve: Curves.fastOutSlowIn,
                height: _responsiveHeight,
                width: _responsiveWidth,
                transform: (_controller.buttonScaleObs.value
                    ? (Matrix4.identity()
                      ..translate(0.025 * _responsiveWidth,0.025 * _responsiveHeight)
                      ..scale(0.95, 0.95))
                    : Matrix4.identity()),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _controller.buttonColorObs.value,
                    border: Border.all(color: _controller.buttonColorObs.value),
                    boxShadow: [
                      BoxShadow(
                        color: _controller.buttonColorObs.value,
                        blurRadius: _controller.buttonShadowBlurObs.value,
                      ),
                    ]),
                child: Image(image: AssetImage(_properties.appLoginImgBtn)),
              ),
            ),
            onTap: () => _loginButtonTriggerAction(context)));
  }

  void _loginButtonTriggerAction(BuildContext context) {
    // @formatter:off
    var isValidEmail = _controller.emailValidation(context);
    _controller.loginButtonAnimation(color: Colors.orange,blur: 0);

    Future.delayed(Duration(milliseconds: _properties.delayStatusElevator))
    .whenComplete(() {
      if(!isValidEmail) _controller.loginButtonAnimation(color: Colors.red,blur: 30);
      FocusScope.of(context).unfocus();
      if (isValidEmail) {
         _controller
          .authentication(_controller.emailController.text.trim())
          .then((isAuthenticed) =>
            isAuthenticed
            ? () {
                  _controller.loginButtonAnimation(color: Colors.green,blur: 30);
                  Future
                  .delayed(Duration(milliseconds: _properties.delayStatusElevator))
                  .whenComplete(() => Get.toNamed(Routes.ELEVATOR_LIST_URL));
                 }.call()
            : () {
                  _controller.loginButtonAnimation(color: Colors.red,blur: 30);
                  Get.defaultDialog(title: _labels.ops, middleText:_messages.authFailContent);
                 }.call());
      }
    });
    // @formatter:on
  }
}