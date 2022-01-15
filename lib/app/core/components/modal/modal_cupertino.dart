import 'package:flutter/cupertino.dart';

import 'i_adaptive_modal.dart';

class ModalCupertino implements IAdaptiveModal {
  @override
  void create(
    BuildContext context,
    String content,
    String labelYes,
    String labelNo,
    Function actionYes,
    Function actionNo,
  ) {
    var cupertinoAlertDialog = CupertinoAlertDialog(
        // title: Text("title"),
        content: Text(content),
        actions: [
          CupertinoButton(child: Text(labelYes), onPressed: () => actionYes.call()),
          CupertinoButton(child: Text(labelNo), onPressed: () => actionNo.call()),
        ]);

    showCupertinoDialog(
      context: context,
      builder: (_) => cupertinoAlertDialog,
    );
  }
}