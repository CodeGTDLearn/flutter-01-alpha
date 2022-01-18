

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'core/platform_drivers/cupertino_app.dart';
import 'core/platform_drivers/material_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();


  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  // Platform.isIOS ? runApp(CupertinoDriver()) : runApp(MaterialDriver());
  Platform.isAndroid ? runApp(CupertinoDriver()) : runApp(MaterialDriver());
}