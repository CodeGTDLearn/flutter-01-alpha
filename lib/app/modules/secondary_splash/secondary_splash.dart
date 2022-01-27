import 'package:flutter/material.dart';
import 'package:flutter_01_alpha/app/core/platforms/get_by_platform.dart';
import 'package:flutter_01_alpha/app/core/properties.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';

import 'splash_adaptive.dart';

class SecondarySplash extends StatelessWidget {
  SecondarySplash({Key? key}) : super(key: key);
  final _properties = Get.put(Properties());
  final _platform = Get.put(GetByPlatform());
  final _secondarySplashScreen= Get.put(SplashAdaptive());

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        // INITIALIZE - METHOD:
        // This is where you can initialize
        // the resources needed by your app while
        // the splash screen is displayed.
        future: Init.instance.initialize(),
        builder: (context, AsyncSnapshot snapshot) {
          // Show splash screen while waiting for app resources to load:
          if (snapshot.connectionState == ConnectionState.waiting) {
            return _properties.appPlatform == "ios"
                ? GetCupertinoApp(home: _secondarySplashScreen)
                : GetMaterialApp(home: _secondarySplashScreen);
          } else {
            // Loading is done, return the app:
            return _platform.appDriver();
          }
        });
  }
}

class Init {
  Init._();

  static final instance = Init._();

  Future initialize() async {
    // This is where you can initialize the resources needed by your app while
    // the splash screen is displayed.
    //
    // Remove the following example because
    // delaying the user experience is a bad design practice!
    await Future.delayed(const Duration(seconds: 3));
  }
}