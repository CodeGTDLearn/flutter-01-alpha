import 'package:flutter/material.dart';
import 'package:flutter_01_alpha/app/modules/elevators_list/components/elevator_details_status_button.dart';
import 'package:flutter_01_alpha/app/modules/elevators_list/entity/elevator.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:get/get.dart';

import '../components/elevator_details_panel.dart';
import '../elevator_list_controller.dart';

class ElevatorDetailsViewAdaptive extends StatelessWidget {
  final Elevator? elevator;

  ElevatorDetailsViewAdaptive({Key? key, this.elevator}) : super(key: key);

  final _controller = Get.find<ElevatorListController>();

  @override
  Widget build(BuildContext context) {
    elevator ?? Get.arguments();
    _controller.buttonLabelStatusObs.value = elevator!.status;
    return PlatformScaffold(
        appBar: PlatformAppBar(
            title: Text("Elevator ID: ${elevator!.id.toString()}|View: Adaptive")),
        body: Center(
            child: Column(children: [
          const Spacer(flex: 1),
          Flexible(
              flex: 5,
              fit: FlexFit.tight,
              child: ElevatorDetailsPanel().create(elevator!)),
          Flexible(
              flex: 5,
              fit: FlexFit.tight,
              child: Container(
                  alignment: Alignment.center,
                  color: Colors.transparent,
                  child: Obx(() => ElevatorDetailsStatusButton()
                      .create(context, _controller, elevator!))))
        ])));
  }
}