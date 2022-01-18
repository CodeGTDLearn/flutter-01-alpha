import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_01_alpha/app/core/components/timer_messager_indicator.dart';
import 'package:flutter_01_alpha/app/core/text/labels.dart';
import 'package:flutter_01_alpha/app/core/text/message_labels.dart';
import 'package:flutter_01_alpha/app/modules/elevators_list/components/multi_sliver_appbar/i_adaptive_sliver_appbar.dart';
import 'package:flutter_01_alpha/app/modules/elevators_list/components/sliver_listview.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';

import '../elevator_list_controller.dart';

class ElevatorListViewMaterial extends StatelessWidget {
  final _labels = Get.find<Labels>();
  final _sliverAppbar = Get.find<IAdaptiveSliverAppBar>(tag: Platform.operatingSystem);
  final _controller = Get.find<ElevatorListController>();
  final _messages = Get.find<MessageLabels>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(() => (_controller.notOnlineElevatorsObs.toList().isEmpty
            ? TimerMessageIndicator.message(
                message: _messages.dbElevatorsEmpty, fontSize: 20)
            : RefreshIndicator(
                onRefresh: _controller.getNotonlineElevators,
                child: _controller.notOnlineElevatorsObs.toList().isEmpty
                    ? Center(child: Text(_messages.elevetorNotFoundYet))
                    : CustomScrollView(slivers: [
                        _sliverAppbar.create(
                          _labels.elevListTitle,
                          trailingIcon: Icons.logout,
                          trailingFunction: Get.back,
                        ),
                        SliverListview()
                            .elevators(_controller.notOnlineElevatorsObs.toList()),
                      ])))));
  }
}