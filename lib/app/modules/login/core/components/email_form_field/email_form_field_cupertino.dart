import 'package:flutter/cupertino.dart';
import 'package:flutter_01_alpha/app/modules/login/login_controller.dart';

class EmailFormFieldCupertino {
  CupertinoTextFormFieldRow field(
    LoginController _controller, {
    String? hint,
    IconData? iconPrefix,
  }) {
    return CupertinoTextFormFieldRow(
      controller: _controller.emailController,
      placeholder: hint,
      keyboardType: TextInputType.emailAddress,
      validator: (email) => _controller.emailValidator(email),
      prefix: Icon(iconPrefix),
      decoration: BoxDecoration(
        color: CupertinoColors.extraLightBackgroundGray,
        border: Border.all(color: CupertinoColors.lightBackgroundGray, width: 2),
        borderRadius: BorderRadius.circular(6),
      ),
    );
  }
}