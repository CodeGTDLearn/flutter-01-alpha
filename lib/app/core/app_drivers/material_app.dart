import 'package:flutter/material.dart';
import 'package:flutter_01_alpha/app/core/platforms/app_themes.dart';
import 'package:flutter_01_alpha/app/core/routes/views_router.dart';
import 'package:flutter_01_alpha/app/core/routes/views_routes.dart';
import 'package:get/get.dart';

import '../core_bindings.dart';
import '../properties.dart';


class MaterialDriver extends StatelessWidget {
  final _properties = Properties();
  final _theme = AppThemes();

  MaterialDriver({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: CoreBindings(),
      navigatorKey: _properties.contextGkey,
      title: _properties.appName,
      debugShowCheckedModeBanner: false,
      theme: _theme.materialTheme(),
      initialRoute: ViewsRoutes.LOGIN_VIEW_URL,
      getPages: ViewsRouter.viewRouting,
      // initialBinding: ,
    );
  }
}