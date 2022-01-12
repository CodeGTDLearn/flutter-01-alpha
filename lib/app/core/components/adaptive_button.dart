import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class AdaptiveButton {
  var platForm = Platform.isAndroid ? "Android" : "Ios";

  PlatformElevatedButton simpleButton(BuildContext context) {
    return PlatformElevatedButton(
      // onPressed: () => CustomModal().create(context, platForm),
      child: PlatformText(platForm),
    );
  }
}