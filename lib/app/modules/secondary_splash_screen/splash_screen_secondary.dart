import 'package:flutter/material.dart';
import 'package:flutter_01_alpha/app/core/platforms/platform_selector.dart';
import 'package:flutter_01_alpha/app/core/properties/app_core_properties.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';

import 'splash_screen_loader_resources.dart';
import 'splash_screen_adaptive.dart';

class SplashScreenSecondary extends StatelessWidget {
    final _properties = Get.put(AppCoreProperties());
    final _platform = Get.put(PlatformSelector());
    final _secondarySplashScreen = Get.put(SplashScreenAdaptive());
    final _secondarySplashScreenLoader = Get.put(SplashScreenLoaderResources.instance);

  SplashScreenSecondary({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
        future: _secondarySplashScreenLoader.initialize(seconds: 3),
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