import 'package:flutter/material.dart';
import 'package:flutter_01_alpha/app/core/platforms/app_core_themes.dart';
import 'package:flutter_01_alpha/app/core/properties/app_core_properties.dart';
import 'package:flutter_01_alpha/app/core/routes/views_router.dart';
import 'package:flutter_01_alpha/app/core/routes/views_routes.dart';
import 'package:get/get.dart';

import '../bindings/app_core_bindings.dart';
import '../crash_monitor/crash_monitor.dart';

class MaterialDriver extends StatelessWidget {
  final _theme = Get.put(AppCoreThemes());
  final _monitor = Get.put(CrashMonitor());
  final _generalProps = Get.find<AppCoreProperties>();


  MaterialDriver({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: _monitor.key,
      builder: _monitor.crashRedScreenSubstitute,
      initialBinding: AppCoreBindings(),
      title: _generalProps.appName,
      debugShowCheckedModeBanner: false,
      theme: _theme.materialTheme(),
      initialRoute: ViewsRoutes.LOGIN_VIEW_URL,
      getPages: ViewsRouter.viewRouting,
    );
  }
}