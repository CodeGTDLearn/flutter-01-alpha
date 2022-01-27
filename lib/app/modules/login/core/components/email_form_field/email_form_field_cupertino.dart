import 'package:flutter/cupertino.dart';
import 'package:flutter_01_alpha/app/core/platforms/cupertino_styles.dart';
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
      prefix: Icon(
        iconPrefix,
        color: CupertinoStyles.iconColor,
      ),
      textCapitalization: TextCapitalization.words,
      decoration: BoxDecoration(
        color: CupertinoStyles.loginBackgroundColor,
        border: Border.all(color: CupertinoStyles.rowDivider, width: 2),
        borderRadius: BorderRadius.circular(6),
      ),
    );
  }
}