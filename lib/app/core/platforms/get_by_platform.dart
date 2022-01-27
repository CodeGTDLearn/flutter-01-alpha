import 'package:flutter/widgets.dart';
import 'package:flutter_01_alpha/app/core/app_drivers/cupertino_app.dart';
import 'package:flutter_01_alpha/app/core/app_drivers/material_app.dart';
import 'package:flutter_01_alpha/app/modules/elevators_list/view/elevator_list_view_cupertino.dart';
import 'package:flutter_01_alpha/app/modules/elevators_list/view/elevator_list_view_material.dart';
import 'package:flutter_01_alpha/app/modules/login/view/login_view_cupertino.dart';
import 'package:flutter_01_alpha/app/modules/login/view/login_view_material.dart';
import 'package:get/instance_manager.dart';

import '../properties.dart';

class GetByPlatform {
  final _properties = Get.put(Properties());

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