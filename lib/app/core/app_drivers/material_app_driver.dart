import 'package:catcher/core/catcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_01_alpha/app/core/platforms/app_themes.dart';
import 'package:flutter_01_alpha/app/core/routes/views_router.dart';
import 'package:flutter_01_alpha/app/core/routes/views_routes.dart';
import 'package:get/get.dart';

import '../core_bindings.dart';
import '../properties.dart';

class MaterialAppDriver extends StatelessWidget {
  final _properties = Get.put(Properties());
  final _theme = Get.put(AppThemes());

  MaterialAppDriver({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      //********************************************
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
      //********************************************
      //********************************************
      initialBinding: CoreBindings(),
      title: _properties.appName,
      debugShowCheckedModeBanner: false,
      theme: _theme.materialTheme(),
      initialRoute: ViewsRoutes.LOGIN_VIEW_URL,
      getPages: ViewsRouter.viewRouting,
      // initialBinding: ,
    );
  }
}