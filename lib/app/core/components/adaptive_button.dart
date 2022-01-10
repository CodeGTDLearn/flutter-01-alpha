import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import 'my_dialog.dart';

class AdaptiveButton {
  var platForm = Platform.isAndroid ? "Android" : "Ios";

  PlatformElevatedButton simpleButton(BuildContext context) {
    return PlatformElevatedButton(
      onPressed: () => MyDialog().modalizinho(context, platForm),
      child: PlatformText(platForm),
    );
  }


}