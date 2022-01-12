import 'package:flutter_01_alpha/app/modules/elevators_list/view/material/elevator_list_view_material.dart';
import 'package:flutter_01_alpha/app/modules/login/view/material/login_view_material.dart';
import 'package:get/route_manager.dart';

import 'bindings/elevator_list_bindings.dart';
import 'bindings/login_bindings.dart';

class Routes {
  static const LOGIN_VIEW_URL = "/login";
  static const ELEVATOR_LIST_URL = "/elevatorList";

  static List<GetPage> appRoutes = [
    GetPage(
      name: LOGIN_VIEW_URL,
      page: () => LoginViewMaterial(),
      bindings: [LoginBindings()],
    ),
    GetPage(
      name: ELEVATOR_LIST_URL,
      page: () => ElevatorListViewMaterial(),
      bindings: [ElevatorListBindings()],
    ),
  ];
}