
import 'package:flutter_01_alpha/app/modules/elevators_list/view/elevator_details_view_adaptive.dart';
import 'package:get/route_manager.dart';
import 'package:get/instance_manager.dart';

import '../../modules/elevators_list/core/elevator_list_bindings.dart';
import '../../modules/login/core/login_bindings.dart';
import '../platforms/get_by_platform.dart';
import 'views_routes.dart';

class ViewsRouter {
  static final _getByPlatform = Get.put(GetByPlatform());

  static List<GetPage> viewRouting = [
    GetPage(
        name: ViewsRoutes.LOGIN_VIEW_URL,
        page: () => _getByPlatform.loginView(),
        bindings: [LoginBindings()]),
    GetPage(
        name: ViewsRoutes.ELEVATOR_LIST_URL,
        page: () => _getByPlatform.elevatorListView(),
        bindings: [ElevatorListBindings()]),
    GetPage(
        name: ViewsRoutes.ELEVATOR_DETAIL_URL,
        page: () => ElevatorDetailsViewAdaptive(),
        bindings: [ElevatorListBindings()]),
  ];
}