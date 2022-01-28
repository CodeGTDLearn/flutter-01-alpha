import 'package:flutter/widgets.dart';
import 'package:flutter_01_alpha/app/core/app_drivers/cupertino_driver.dart';
import 'package:flutter_01_alpha/app/core/app_drivers/material_driver.dart';
import 'package:flutter_01_alpha/app/core/properties/app_core_properties.dart';
import 'package:flutter_01_alpha/app/modules/elevators_list/view/elevator_list_view_cupertino.dart';
import 'package:flutter_01_alpha/app/modules/elevators_list/view/elevator_list_view_material.dart';
import 'package:flutter_01_alpha/app/modules/login/view/login_view_cupertino.dart';
import 'package:flutter_01_alpha/app/modules/login/view/login_view_material.dart';
import 'package:get/instance_manager.dart';


class PlatformSelector {
  final _properties = Get.find<AppCoreProperties>();

  StatelessWidget appDriver() {
    if ('ios' == _properties.appPlatform) return CupertinoDriver();
    return MaterialDriver();
  }

  StatelessWidget loginView() {
    if ('ios' == _properties.appPlatform) return LoginViewCupertino();
    return LoginViewMaterial();
  }

  StatelessWidget elevatorListView() {
    if ('ios' == _properties.appPlatform) return ElevatorListViewCupertino();
    return ElevatorListViewMaterial();
  }


}