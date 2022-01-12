import 'package:flutter/material.dart';

class CustomModal {
  void create({
    required BuildContext context,
    required String content,
    required String labelYes,
    required String labelNo,
    required Function actionYes,
    required Function actionNo,
  }) {
    var alertDialog = AlertDialog(content: Text(content), actions: [
      TextButton(
        onPressed: () => actionNo.call(),
        child: Text(labelNo),
      ),
      TextButton(
        onPressed: () => actionYes.call(),
        child: Text(labelYes),
      )
    ]);

    showDialog(
      context: context,
      builder: (context) => alertDialog,
    );
  }
}