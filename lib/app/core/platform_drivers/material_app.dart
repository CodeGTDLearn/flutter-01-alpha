import 'package:flutter/material.dart';
import 'package:flutter_01_alpha/app/core/theme.dart';
import 'package:get/get.dart';

import '../properties.dart';
import '../routes.dart';

class MaterialDriver extends StatelessWidget {
  Properties _properties = Properties();
  AppTheme _theme = AppTheme();

  MaterialDriver({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: _properties.appName,
      debugShowCheckedModeBanner: false,
      theme: _theme.materialTheme(),
      initialRoute: Routes.LOGIN_VIEW_URL,
      getPages: Routes.appRoutes,
    );
  }
}