import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_01_alpha/app/core/properties/app_core_properties.dart';
import 'package:flutter_01_alpha/app/core/properties/app_core_image_properties.dart';
import 'package:get/instance_manager.dart';

class SplashScreenAdaptive extends StatelessWidget {
  final _properties = Get.find<AppCoreProperties>();
  final _images = Get.put(AppCoreImageProperties());

  SplashScreenAdaptive({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    bool lightMode = MediaQuery.of(context).platformBrightness == Brightness.light;
    var background = lightMode ? const Color(0xffe1f5fe) : const Color(0xff042a49);

    var body = SafeArea(
        child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Image(image: AssetImage(_images.appLogo))),
          SizedBox(height: MediaQuery.of(context).size.width * 0.3),
          _properties.appPlatform == 'ios'
              ? Image.asset(_images.cupertinoIndicator)
              : Image.asset(_images.materialIndicator),
        ],
      ),
    ));

    return _properties.appPlatform == 'ios'
        ? CupertinoPageScaffold(backgroundColor: background, child: body)
        : Scaffold(backgroundColor: background, body: body);
  }
}