import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_01_alpha/app/core/components/custom_modal.dart';
import 'package:flutter_01_alpha/app/core/labels.dart';
import 'package:flutter_01_alpha/app/core/message_labels.dart';
import 'package:flutter_01_alpha/app/core/properties.dart';
import 'package:flutter_01_alpha/app/modules/elevators_list/entity/elevator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../elevator_controller.dart';

class ElevatorDetailView extends StatelessWidget {
  final Elevator _elevator;

  ElevatorDetailView(this._elevator);

  final _messages = Get.find<MessageLabels>();
  final _properties = Get.find<Properties>();
  final _labels = Get.find<Labels>();
  final _controller = Get.find<ElevatorListController>();

  @override
  Widget build(BuildContext context) {
    _controller.elevatorStatusObs.value = _elevator.status;

    return Scaffold(
        appBar: AppBar(
          title: Text("Elevator n: ${_elevator.id.toString()}"),
          centerTitle: true,
        ),
        body: Center(
            child: Column(children: [
          Flexible(
              fit: FlexFit.tight,
              child: Container(width: double.infinity, child: Text("xxxxxxxxxxxx"))),
          Flexible(
              fit: FlexFit.tight,
              child: RichText(
                  text: TextSpan(
                      text: 'yyyyyyyyyyyyyyyy',
                      style: GoogleFonts.lato(
                          textStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                      children: <TextSpan>[
                    TextSpan(
                        text: '\$',
                        style: GoogleFonts.lato(
                            textStyle: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                        )))
                  ]))),
          Flexible(
              fit: FlexFit.tight,
              child: Container(
                  color: Colors.red,
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Obx(
                    () => InkWell(
                        child: Container(
                            child: Text(_controller.elevatorStatusObs.value,
                                style: GoogleFonts.lato(
                                  textStyle: const TextStyle(
                                      fontSize: 15, fontWeight: FontWeight.normal),
                                )),
                            decoration: BoxDecoration(
                                color: Colors.red,
                                border: Border.all(
                                  color: Colors.black,
                                  width: 8,
                                ),
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [_boxShadow()])),
                        onTap: () {
                          CustomModal().create(
                              context: context,
                              content: _messages.confirmation,
                              labelYes: _labels.yes,
                              labelNo: _labels.no,
                              actionNo: () => Get.back(),
                              actionYes: () async {
                                Get.back();
                                await _controller
                                    .updateElevatorStatus(_elevator.id.toString())
                                    .then((value) => _elevator.status = value);
                                await Future.delayed(Duration(
                                  milliseconds: _properties.delay_status_elevator))
                                .whenComplete(() => Get.back());
                              });

                          // @formatter:on
                        }),
                  )))
        ])));
  }

  BoxShadow _boxShadow() =>
      BoxShadow(color: Colors.grey, offset: Offset(1.0, 1.0), blurRadius: 3.0);
}