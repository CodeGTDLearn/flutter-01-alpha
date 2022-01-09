import 'package:flutter/material.dart';

class MyDialog {

  void modalizinho(BuildContext context, String label) {
    var alertDialog = AlertDialog(
      title: Text(label),
      actions: [
        TextButton(
            child: Text("Quit"),
            onPressed: () {
              Navigator.of(context).pop();
            })
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alertDialog;
      },
    );
  }
}