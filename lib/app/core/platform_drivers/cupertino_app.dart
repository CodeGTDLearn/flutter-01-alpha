import 'package:flutter/material.dart';
import 'package:flutter_01_alpha/app/core/theme.dart';
import 'package:get/get_navigation/src/root/get_cupertino_app.dart';


import '../properties.dart';
import '../routes.dart';

class CupertinoDriver extends StatelessWidget {
  Properties _properties = Properties();
  AppTheme _theme = AppTheme();

  CupertinoDriver({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetCupertinoApp(
      title: _properties.appName,
      debugShowCheckedModeBanner: false,
      theme: _theme.cupertinoTheme(),
      initialRoute: Routes.LOGIN_VIEW_URL,
      getPages: Routes.appRoutes,
    );
  }
}