import 'package:flutter/material.dart';
import 'package:flutter_01_alpha/app/core/platforms/select_by_platform.dart';
import 'package:flutter_01_alpha/app/core/properties.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';

import 'splash_adaptive.dart';

class SecondarySplash extends StatelessWidget {
  const SecondarySplash({Key? key}) : super(key: key);
  static final _properties = Get.put(Properties());

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
              ? GetCupertinoApp(home: SplashAdaptive())
              : GetMaterialApp(home: SplashAdaptive());
        } else {
          // Loading is done, return the app:
          return SelectByPlatform().appDriver();
        }
      },
    );
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