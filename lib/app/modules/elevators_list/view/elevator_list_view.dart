import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_01_alpha/app/core/components/custom_indicator.dart';
import 'package:flutter_01_alpha/app/core/labels.dart';
import 'package:flutter_01_alpha/app/core/message_labels.dart';
import 'package:flutter_01_alpha/app/modules/elevators_list/components/custom_sliver_appbar.dart';
import 'package:flutter_01_alpha/app/modules/elevators_list/components/sliver_listview.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';

import '../elevator_controller.dart';

class ElevatorListView extends StatelessWidget {
  // const ElevatorList({Key? key}) : super(key: key);

  final _labels = Get.find<Labels>();
  final _sliverAppbar = Get.find<CustomSliverAppBar>();
  final _controller = Get.find<ElevatorListController>();
  final _messages = Get.find<MessageLabels>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(
      () => (_controller.notOnlineElevatorsObs.toList().isEmpty
          ? CustomIndicator.message(message: "_messages.elev_not_found_yet", fontSize: 20)
          : RefreshIndicator(
              onRefresh: _controller.getNotonlineElevators,
              child: _controller.notOnlineElevatorsObs.toList().isEmpty
                  ? Center(child: Text(_messages.elev_not_found_yet))
                  : CustomScrollView(slivers: [
                      _sliverAppbar.create(_labels.elev_list_title, () {
                        Get.back();
                      }, icon: Icons.logout
                          // , actions: [
                          // _animations.openContainer(
                          //     milliseconds: 1000,
                          //     openingWidget: ElevatorDetailView(),
                          //     closingWidget: Container(
                          //         // key: Key(_keys.k_inv_add_btn_appbar()),
                          //         alignment: Alignment.center,
                          //         child: Icon(Icons.logout),
                          //         width: 50,
                          //         decoration: BoxDecoration(
                          //             color: Colors.pink,
                          //             border: Border.all(color: Colors.transparent))))
                          // ],
                          ),
                      SliverListview().elevators(_controller.notOnlineElevatorsObs.toList()),
                    ]),
            )),
    ));
  }
}