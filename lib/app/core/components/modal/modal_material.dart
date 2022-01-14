import 'package:flutter/material.dart';

import 'i_adaptive_modal.dart';

class ModalMaterial implements IAdaptiveModal {
  @override
  void create(
    BuildContext context,
    String content, {
    String? labelYes,
    String? labelNo,
    Function? actionYes,
    Function? actionNo,
  }) {
    var _noButton = labelNo == null
        ? TextButton(
            onPressed: () => actionNo!.call(),
            child: Text(labelNo!),
          )
        : null;

    var _yesButton = labelYes == null
        ? TextButton(
            onPressed: () => actionYes!.call(),
            child: Text(labelYes!),
          )
        : null;

    var alertDialog = AlertDialog(content: Text(content), actions: [
      _yesButton!,
      _noButton!,
    ]);

    showDialog(
      context: context,
      builder: (context) => alertDialog,
    );
  }
}