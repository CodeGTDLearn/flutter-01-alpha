import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_01_alpha/app/core/message_labels.dart';
import 'package:get/instance_manager.dart';

class EmailField extends StatefulWidget {
  final TextEditingController controller;

  const EmailField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  _EmailFieldState createState() => _EmailFieldState();
}

class _EmailFieldState extends State<EmailField> {
  final _messages = Get.find<MessageLabels>();

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(onListen);
  }

  @override
  void dispose() {
    widget.controller.removeListener(onListen);
    super.dispose();
  }

  void onListen() => setState(() {});

  @override
  Widget build(BuildContext context) => TextFormField(
        controller: widget.controller,
        decoration: InputDecoration(
          hintText: 'Email',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          prefixIcon: Icon(Icons.mail),
          suffixIcon: widget.controller.text.isEmpty
              ? Container(width: 0)
              : IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () => widget.controller.clear(),
                ),
        ),
        keyboardType: TextInputType.emailAddress,
        validator: (email) => email != null && !EmailValidator.validate(email)
            ? _messages.email_format_field()
            : null,
      );
}