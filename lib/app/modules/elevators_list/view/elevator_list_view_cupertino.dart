import 'package:flutter/cupertino.dart';
import 'package:flutter_01_alpha/app/core/components/timer_indicator.dart';
import 'package:flutter_01_alpha/app/core/text/labels.dart';
import 'package:flutter_01_alpha/app/core/text/message_labels.dart';
import 'package:flutter_01_alpha/app/modules/elevators_list/components/mult_sliver_appbar.dart';
import 'package:flutter_01_alpha/app/modules/elevators_list/components/sliver_listview.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';

import '../elevator_controller.dart';

class ElevatorListViewCupertino extends StatelessWidget {
  // const ElevatorList({Key? key}) : super(key: key);

  final _labels = Get.find<Labels>();
  final _sliverAppbar = Get.find<MultSliverAppBar>();
  final _controller = Get.find<ElevatorListController>();
  final _messages = Get.find<MessageLabels>();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(middle: Text(_labels.elevListTitle)),
        child: Obx(() => (_controller.notOnlineElevatorsObs.toList().isEmpty
            ? TimerIndicator.message(message: _messages.dbElevatorsEmpty, fontSize: 20)
            : FutureBuilder(
                future: _controller.getNotonlineElevators(),
                builder: (c, snap) {
                  if (snap.hasError) {
                    return TimerIndicator.message(
                        message: _messages.error_try_later, fontSize: 20);
                  }
                  return _customScrollView();
                }))));
  }

  Widget _customScrollView() {
    return SafeArea(
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          CupertinoSliverRefreshControl(
            onRefresh: _controller.getNotonlineElevators,
          ),
          _sliverAppbar.create(_labels.elevListTitle,
              icon: CupertinoIcons.square_arrow_left,
              actions: [
                Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: GestureDetector(
                      onTap: () => Get.back(),
                      child: const Icon(CupertinoIcons.square_arrow_left),
                    ))
              ]),
          SliverListview().elevators(_controller.notOnlineElevatorsObs.toList()),
        ],
      ),
    );
  }
}