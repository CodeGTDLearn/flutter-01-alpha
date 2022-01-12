import 'dart:io';

import 'package:flutter/material.dart';

import 'core/platform_drivers/cupertino_app.dart';
import 'core/platform_drivers/material_app.dart';

// void main() => runApp(AppDriver());
void main() => Platform.isIOS
    ? runApp(CupertinoDriver())
    : runApp(
        MaterialDriver(),
      );