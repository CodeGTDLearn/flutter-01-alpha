import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import 'my_dialog.dart';

class AdaptiveButton {
  var plat = Platform.isAndroid ? "Android" : "Ios";

  PlatformElevatedButton button(BuildContext context) {
    return PlatformElevatedButton(
      onPressed: () => MyDialog().modalizinho(context, plat),
      child: PlatformText(plat),
    );
  }


}