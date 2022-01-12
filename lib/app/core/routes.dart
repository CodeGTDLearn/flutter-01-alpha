import 'package:flutter_01_alpha/app/modules/elevators_list/view/elevator_list_view.dart';
import 'package:flutter_01_alpha/app/modules/login/login_view.dart';
import 'package:get/route_manager.dart';

import 'bindings/elevator_list_bindings.dart';
import 'bindings/login_bindings.dart';

class Routes {
  static const LOGIN_VIEW_URL = "/login";
  static const ELEVATOR_LIST_URL = "/elevatorList";

  static List<GetPage> appRoutes = [
    GetPage(
      name: LOGIN_VIEW_URL,
      page: () => LoginView(),
      bindings: [LoginBindings()],
    ),
    GetPage(
      name: ELEVATOR_LIST_URL,
      page: () => ElevatorListView(),
      bindings: [ElevatorListBindings()],
    ),
  ];
}