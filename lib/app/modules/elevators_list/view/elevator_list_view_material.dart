import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_01_alpha/app/core/components/app_core_messager_indicator_adaptive.dart';
import 'package:flutter_01_alpha/app/core/properties/app_core_properties.dart';
import 'package:flutter_01_alpha/app/core/text/app_core_labels.dart';
import 'package:flutter_01_alpha/app/core/text/app_core_messages.dart';
import 'package:flutter_01_alpha/app/modules/elevators_list/core/components/sliver_appbar/i_sliver_appbar.dart';
import 'package:flutter_01_alpha/app/modules/elevators_list/core/components/sliver_listview.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';

import '../elevator_list_controller.dart';

class ElevatorListViewMaterial extends StatelessWidget {
  final _labels = Get.find<AppCoreLabels>();
  final _messages = Get.find<AppCoreMessages>();
  final _properties = Get.find<AppCoreProperties>();
  final _platform = Platform.operatingSystem;
  final _controller = Get.find<ElevatorListController>();

  @override
  Widget build(BuildContext context) {
    final _sliverAppbar = Get.find<ISliverAppBar>(tag: _properties.appPlatform);
    return Scaffold(
        body: Obx(() => (_controller.notOnlineStatusObs.toList().isEmpty
            ? AppCoreMessageIndicatorAdaptive.message(
                message: _messages.dbElevatorsEmpty, fontSize: 20)
            : RefreshIndicator(
                onRefresh: _controller.getNotonlineElevators,
                child: _controller.notOnlineStatusObs.toList().isEmpty
                    ? Center(child: Text(_messages.elevetorNotFoundYet))
                    : CustomScrollView(slivers: [
                        _sliverAppbar.create(
                          '${_labels.elevListTitle}|View:$_platform',
                          trailingIcon: Icons.logout,
                          trailingFunction: () => Get.back.call(),
                        ),
                        SliverListview()
                            .elevators(_controller.notOnlineStatusObs.toList()),
                      ])))));
  }
}