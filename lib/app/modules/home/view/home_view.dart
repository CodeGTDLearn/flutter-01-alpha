import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_01_alpha/app/core/components/adaptive_button.dart';
import 'package:flutter_01_alpha/app/core/properties.dart';
import 'package:flutter_01_alpha/app/modules/home/components/view_label.dart';
import 'package:flutter_01_alpha/app/modules/home/controller/home_controller.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';

import '../components/view_button.dart';

class HomeView extends StatelessWidget {
  final _properties = Get.find<Properties>();
  final controller = Get.find<HomeController>();
  final _viewLabel = Get.find<ViewLabel>();
  final _adaptiveButton = Get.find<AdaptiveButton>();
  final _viewButton = Get.find<ViewButton>();

  @override
  Widget build(BuildContext context) {
    var tipoDePlataforma = Platform.isAndroid ? "Android" : "Ios";
    return Scaffold(
      appBar: AppBar(title: Text(_properties.appTitle())),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // ViewLabel(),
          _viewLabel,
          Obx(() => Text(
                '${controller.showContagemNaTelaObs}',
                style: Theme.of(context).textTheme.headline4,
              )),
          // AdaptiveButton().button(context),
          _adaptiveButton.simpleButton(context),
        ],
      )),
      floatingActionButton: _viewButton.button(
        controller.alteraContagemNaTela,
      ),
    );
  }
}