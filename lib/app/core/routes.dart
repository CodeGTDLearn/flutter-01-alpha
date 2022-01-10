import 'package:flutter_01_alpha/app/modules/home/view/home_view.dart';
import 'package:get/route_manager.dart';

import 'bindings/home_bindings.dart';

class Routes {
  static const HOME_VIEW_URL = "/home";

  static List<GetPage> appRoutes = [
    GetPage(
      name: HOME_VIEW_URL,
      page: () => HomeView(),
      bindings: [
        HomeBindings(),
      ],
    ),
  ];
}