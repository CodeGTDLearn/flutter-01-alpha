
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'modules/secondary_splash/secondary_splash.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(const SecondarySplash());
}