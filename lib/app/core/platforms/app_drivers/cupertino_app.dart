import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_01_alpha/app/core/platforms/look_feel/app_themes.dart';
import 'package:flutter_01_alpha/app/core/routes/views_router.dart';
import 'package:flutter_01_alpha/app/core/routes/views_routes.dart';
import 'package:get/get_navigation/src/root/get_cupertino_app.dart';

import '../../properties.dart';

class CupertinoDriver extends StatelessWidget {
  final _properties = Properties();
  final _theme = AppThemes();

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
        initialRoute: ViewsRoutes.LOGIN_VIEW_URL,
        getPages: ViewsRouter.viewRouting,
        localizationsDelegates: _properties.localizationsDelegates);
  }
}