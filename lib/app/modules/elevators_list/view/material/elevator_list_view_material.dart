import 'package:flutter/material.dart';
import 'package:flutter_01_alpha/app/core/components/custom_indicator.dart';
import 'package:flutter_01_alpha/app/core/labels.dart';
import 'package:flutter_01_alpha/app/core/message_labels.dart';
import 'package:flutter_01_alpha/app/modules/elevators_list/components/custom_sliver_appbar.dart';
import 'package:flutter_01_alpha/app/modules/elevators_list/components/sliver_listview.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';

import '../../elevator_controller.dart';

class ElevatorListViewMaterial extends StatelessWidget {
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
          ? CustomIndicator.message(message: _messages.elev_not_found_yet, fontSize: 20)
          : RefreshIndicator(
              onRefresh: _controller.getNotonlineElevators,
              child: _controller.notOnlineElevatorsObs.toList().isEmpty
                  ? Center(child: Text(_messages.elev_not_found_yet))
                  : CustomScrollView(slivers: [
                      _sliverAppbar.create(
                        _labels.elev_list_title,
                        icon: Icons.logout,
                        actions: [
                          Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: GestureDetector(
                              onTap: () => Get.back(),
                              child: const Icon(Icons.logout),
                            ),
                          )
                        ],
                      ),
                      SliverListview()
                          .elevators(_controller.notOnlineElevatorsObs.toList()),
                    ]),
            )),
    ));
  }
}