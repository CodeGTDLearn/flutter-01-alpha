
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_01_alpha/app/core/components/messager_indicator_adaptive.dart';
import 'package:flutter_01_alpha/app/core/properties.dart';
import 'package:flutter_01_alpha/app/core/text/labels.dart';
import 'package:flutter_01_alpha/app/core/text/message_labels.dart';
import 'package:flutter_01_alpha/app/modules/elevators_list/core/components/sliver_appbar/i_sliver_appbar.dart';
import 'package:flutter_01_alpha/app/modules/elevators_list/core/components/sliver_listview.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';

import '../elevator_list_controller.dart';

class ElevatorListViewCupertino extends StatelessWidget {
  final _labels = Get.find<Labels>();
  final _platform = Platform.operatingSystem;
  final _controller = Get.find<ElevatorListController>();
  final _messages = Get.find<MessageLabels>();
  final _properties = Get.find<Properties>();


  @override
  Widget build(BuildContext context) {
    _controller.elevatorListViewCupertinoContext = context;
    return CupertinoPageScaffold(
        // navigationBar: CupertinoNavigationBar(middle: Text(_labels.elevListTitle)),
        child: Obx(() => (_controller.notOnlineStatusObs.toList().isEmpty
            ? MessageIndicatorAdaptive.message(
                message: _messages.dbElevatorsEmpty, fontSize: 20)
            : FutureBuilder(
                future: _controller.getNotonlineElevators(),
                builder: (c, snap) {
                  if (snap.hasError) {
                    return MessageIndicatorAdaptive.message(
                        message: _messages.errorTryAgainLater, fontSize: 20);
                  }
                  return _customScrollView();
                }))));
  }

  Widget _customScrollView() {
    final _sliverAppbar = Get.find<ISliverAppBar>(tag: _properties.appPlatform);
    return SafeArea(
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          CupertinoSliverRefreshControl(onRefresh: _controller.getNotonlineElevators),
          _sliverAppbar.create(
            '${_labels.elevListTitle}|View:$_platform',
            trailingIcon: CupertinoIcons.square_arrow_left,
            trailingFunction: () => Get.back.call(),
          ),
          SliverListview().elevators(_controller.notOnlineStatusObs.toList()),
        ],
      ),
    );
  }
}