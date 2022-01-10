import 'package:flutter/material.dart';
import 'package:flutter_01_alpha/app/core/theme.dart';
import 'package:get/get.dart';

import 'core/properties.dart';
import 'core/routes.dart';
import 'modules/home/view/home_view.dart';

void main() => runApp(AppDriver());

class AppDriver extends StatelessWidget {
  Properties _properties = Properties();
  AppTheme _theme = AppTheme();

  AppDriver({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: _properties.appName(),
      debugShowCheckedModeBanner: false,
      theme: _theme.theme(),
      // home: HomeView(),
      initialRoute: Routes.HOME_VIEW_URL,
      getPages: Routes.appRoutes,
    );
  }
}
// return GetMaterialApp(
// navigatorKey: APP_CONTEXT_GLOBAL_KEY,
// title: APP_TITLE,
// theme: _appTheme.theme(_darkTheme.isDark.value),
// initialRoute: Routes.OVERVIEW_ALL,
// getPages: Routes.getAppRoutes,
// );