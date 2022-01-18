import 'dart:io';

import 'package:flutter_01_alpha/app/modules/elevators_list/view/elevator_detail_view_adaptive.dart';
import 'package:flutter_01_alpha/app/modules/elevators_list/view/elevator_list_view_cupertino.dart';
import 'package:flutter_01_alpha/app/modules/elevators_list/view/elevator_list_view_material.dart';
import 'package:flutter_01_alpha/app/modules/login/view/login_view_cupertino.dart';
import 'package:flutter_01_alpha/app/modules/login/view/login_view_material.dart';
import 'package:get/route_manager.dart';

import 'bindings/elevator_list_bindings.dart';
import 'bindings/login_bindings.dart';

class Routes {
  static const LOGIN_VIEW_URL = "/login";
  static const ELEVATOR_LIST_URL = "/elevatorList";
  static const ELEVATOR_DETAIL_URL = "/elevatorDetail";

  static List<GetPage> appRoutes = [
    GetPage(
        name: LOGIN_VIEW_URL,
        page: () => Platform.isIOS ? LoginViewCupertino() : LoginViewMaterial(),
        // page: () => Platform.isAndroid ? LoginViewCupertino() : LoginViewMaterial(),
        bindings: [LoginBindings()]),
    GetPage(
        name: ELEVATOR_LIST_URL,
        page: () =>
            Platform.isIOS ? ElevatorListViewCupertino() : ElevatorListViewMaterial(),
        // Platform.isAndroid ? ElevatorListViewCupertino() : ElevatorListViewMaterial(),
        bindings: [ElevatorListBindings()]),
    GetPage(
        name: ELEVATOR_DETAIL_URL,
        page: () => ElevatorDetailViewAdaptive(),
        bindings: [ElevatorListBindings()]),
  ];
}