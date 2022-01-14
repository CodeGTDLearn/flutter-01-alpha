import 'package:flutter/cupertino.dart';

import 'i_adaptive_modal.dart';

class ModalCupertino implements IAdaptiveModal {
  @override
  void create(
    BuildContext context,
    String content, {
    String? labelYes,
    String? labelNo,
    Function? actionYes,
    Function? actionNo,
  }) {
    var _yesButton = labelYes == null
        ? CupertinoButton(
            child: Text(labelYes!),
            onPressed: () => actionYes!.call(),
          )
        : null;

    var _noButton = labelNo == null
        ? CupertinoButton(
            child: Text(labelNo!),
            onPressed: () => actionNo!.call(),
          )
        : null;

    var cupertinoAlertDialog = CupertinoAlertDialog(
        // title: Text("title"),
        content: Text(content),
        actions: [
          _yesButton!,
          _noButton!,
        ]);

    showCupertinoDialog(context: context, builder: (_) => cupertinoAlertDialog);
  }
}