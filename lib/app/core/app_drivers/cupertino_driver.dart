import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_01_alpha/app/core/platforms/app_core_themes.dart';
import 'package:flutter_01_alpha/app/core/properties/app_core_properties.dart';
import 'package:flutter_01_alpha/app/core/routes/views_router.dart';
import 'package:flutter_01_alpha/app/core/routes/views_routes.dart';
import 'package:get/get_navigation/src/root/get_cupertino_app.dart';
import 'package:get/instance_manager.dart';

import '../bindings/app_core_bindings.dart';
import '../crash_monitor/crash_monitor.dart';
import '../properties/app_core_localization_properties.dart';

class CupertinoDriver extends StatelessWidget {
  final _theme = Get.put(AppCoreThemes());
  final _monitor = Get.put(CrashMonitor());
  final _generalProps = Get.find<AppCoreProperties>();
  final _localProps = Get.put(AppCoreLocalizationProperties());

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
        navigatorKey: _monitor.key,
        builder: _monitor.crashRedScreenSubstitute,
        initialBinding: AppCoreBindings(),
        title: _generalProps.appName,
        debugShowCheckedModeBanner: false,
        theme: _theme.cupertinoTheme(),
        initialRoute: ViewsRoutes.LOGIN_VIEW_URL,
        getPages: ViewsRouter.viewRouting,
        localizationsDelegates: _localProps.localizationsDelegates);
  }
}