import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppTheme {
  ThemeData materialTheme() => ThemeData(
        primarySwatch: Colors.blue,
        // dividerColor: Colors.pink,
      );

  CupertinoThemeData cupertinoTheme() {
    return CupertinoThemeData(
      primaryColor: Colors.red,
      // primaryContrastingColor: Color.fromARGB(255, 100, 100, 255),
      // barBackgroundColor: Color.fromARGB(255, 255, 100, 100),
      textTheme: CupertinoTextThemeData(
          navLargeTitleTextStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 22.0,
        color: CupertinoColors.activeGreen,
      )),
    );
  }
}