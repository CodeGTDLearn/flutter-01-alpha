import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_01_alpha/app/modules/login/login_controller.dart';

class EmailFormFieldMaterial {
  TextFormField field(
    LoginController _controller, {
    String? hint,
    IconData? iconPrefix,
    IconData? iconSufix,
  }) {
    return TextFormField(
        controller: _controller.emailController,
        keyboardType: TextInputType.emailAddress,
        validator: (email) => _controller.emailValidator(email),
        decoration: InputDecoration(
            hintText: hint,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            prefixIcon: Icon(iconPrefix),
            suffixIcon: _controller.emailController.text.isEmpty
                ? Container(width: 0)
                : IconButton(
                    icon: Icon(iconSufix),
                    onPressed: () => _controller.emailController.clear(),
                  )));
  }
}