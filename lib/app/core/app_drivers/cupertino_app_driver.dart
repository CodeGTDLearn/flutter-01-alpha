import 'package:catcher/core/catcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_01_alpha/app/core/platforms/app_themes.dart';
import 'package:flutter_01_alpha/app/core/routes/views_router.dart';
import 'package:flutter_01_alpha/app/core/routes/views_routes.dart';
import 'package:get/get_navigation/src/root/get_cupertino_app.dart';
import 'package:get/instance_manager.dart';

import '../core_bindings.dart';
import '../properties.dart';

class CupertinoAppDriver extends StatelessWidget {
  final _properties = Get.put(Properties());
  final _theme = Get.put(AppThemes());

  CupertinoAppDriver({Key? key}) : super(key: key);

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
        //********************************************
        // navigatorKey: _properties.contextGkey,
        navigatorKey: Catcher.navigatorKey,
        //********************************************
        //********************************************
        builder: (BuildContext context, Widget? widget) {
          Catcher.addDefaultErrorWidget(
              showStacktrace: true,
              title: "Custom error title",
              description: "Custom error description",
              maxWidthForSmallMode: 150);
          return widget!;
        },
        //********************************************
        initialBinding: CoreBindings(),
        title: _properties.appName,
        debugShowCheckedModeBanner: false,
        theme: _theme.cupertinoTheme(),
        initialRoute: ViewsRoutes.LOGIN_VIEW_URL,
        getPages: ViewsRouter.viewRouting,
        localizationsDelegates: _properties.localizationsDelegates);
  }
}