import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_01_alpha/app/core/look_feel/theme.dart';
import 'package:get/get_navigation/src/root/get_cupertino_app.dart';

import '../properties.dart';
import '../routes.dart';

class CupertinoDriver extends StatelessWidget {
  final Properties _properties = Properties();
  final AppTheme _theme = AppTheme();

  CupertinoDriver({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /*
  ╔═════════════════════════════════════════════════════════╗
  ║       Instantiates CupertinoApp, which provides:        ║
  ║ theming, navigation, text direction, and other defaults ║
  ║    required to create an app that an iOS user expects.  ║
  ╚═════════════════════════════════════════════════════════╝
  */

    return GetCupertinoApp(
        navigatorKey: _properties.contextGkey,
        title: _properties.appName,
        debugShowCheckedModeBanner: false,
        theme: _theme.cupertinoTheme(),
        initialRoute: Routes.LOGIN_VIEW_URL,
        getPages: Routes.appRoutes,
        localizationsDelegates: _properties.localizationsDelegates2);
  }
}