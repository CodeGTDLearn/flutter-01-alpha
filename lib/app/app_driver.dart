import 'package:flutter/material.dart';
import 'package:flutter_01_alpha/app/core/theme.dart';
import 'package:get/get.dart';

import 'core/properties.dart';
import 'core/routes.dart';

void main() => runApp(AppDriver());

class AppDriver extends StatelessWidget {
  Properties _properties = Properties();
  AppTheme _theme = AppTheme();

  AppDriver({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: _properties.appName,
      debugShowCheckedModeBanner: false,
      theme: _theme.theme(),
      initialRoute: Routes.LOGIN_VIEW_URL,
      getPages: Routes.appRoutes,
    );
  }
}