import 'package:flutter/material.dart';
import 'package:flutter_01_alpha/app/core/theme.dart';

import 'core/properties.dart';
import 'modules/home/home_view.dart';



void main() => runApp(AppDriver());


class AppDriver extends StatelessWidget {

  Properties _properties = Properties();
  AppTheme _theme = AppTheme();

  AppDriver({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: _properties.appName(),
        theme: _theme.theme(),
        home: HomeView(_properties.appTitle()));
  }

}