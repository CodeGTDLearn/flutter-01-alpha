import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'core/crash_monitor/crash_monitor.dart';
import 'modules/secondary_splash_screen/splash_screen_secondary.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  // CRASH_MONITOR MUST HAVE
  // A COMMON-INSTANCING IN THIS MAIN-METHOD
  // HENCE, DO NOT USER GetX do mange instance here
  CrashMonitor().runApp(SplashScreenSecondary());
}