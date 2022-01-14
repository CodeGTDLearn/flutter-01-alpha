import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_01_alpha/app/core/components/modal/i_adaptive_modal.dart';
import 'package:flutter_01_alpha/app/core/properties.dart';
import 'package:flutter_01_alpha/app/core/text/labels.dart';
import 'package:flutter_01_alpha/app/core/text/message_labels.dart';
import 'package:flutter_01_alpha/app/modules/elevators_list/entity/elevator.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../elevator_controller.dart';

class ElevatorDetailViewAdaptive extends StatelessWidget {
  Elevator? elevator;

  ElevatorDetailViewAdaptive({this.elevator});

  final _messages = Get.find<MessageLabels>();
  final _properties = Get.find<Properties>();
  final _labels = Get.find<Labels>();
  final _controller = Get.find<ElevatorListController>();
  final _modal = Get.find<IAdaptiveModal>(tag: Platform.operatingSystem);

  @override
  Widget build(BuildContext context) {
    elevator ?? Get.arguments();
    _controller.elevatorStatusObs.value = elevator!.status;

    return PlatformScaffold(
        appBar: PlatformAppBar(title: Text("Elevator ID: ${elevator!.id.toString()}")),
        body: Center(
            child: Column(children: [
          Flexible(fit: FlexFit.tight, child: _elevatorInfoCard()),
          Flexible(
              fit: FlexFit.tight,
              child: Container(
                  alignment: Alignment.center,
                  child: Obx(
                    () => InkWell(
                        child: _button(),
                        onTap: () {
                          _adaptiveModalConfirmation(context);
                        }),
                  )))
        ])));
  }

  Future<void> _adaptiveModalConfirmation(context) async {
    return _modal.create(
      context,
      _messages.confirmation,
      labelYes: _labels.yes,
      labelNo: _labels.no,
      actionNo: () => Get.back(),
      actionYes: () async {
        await _controller
            .updateElevatorStatus(elevator!.id.toString())
            .then((elevatorStatus) async {
          if (elevatorStatus == 'online') await _updateSucess(elevatorStatus);
          if (elevatorStatus == 'error') _updateFail();
        });
      },
    );
  }

  Container _button() {
    return Container(
        margin: EdgeInsets.all(20),
        height: 100,
        width: double.infinity,
        alignment: Alignment.center,
        child: Text(_controller.elevatorStatusObs.value,
            softWrap: true,
            textAlign: TextAlign.center,
            style: GoogleFonts.roboto(
              textStyle: const TextStyle(
                fontSize: 50,
                // fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            )),
        decoration: BoxDecoration(
            color: _controller.elevatorStatusObs.value == 'online'
                ? Colors.green
                : Colors.red,
            border: Border.all(
              color: Colors.transparent,
            ),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [_boxShadow()]));
  }

  Container _elevatorInfoCard() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(30),
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _richTextLine("S/N: ", elevator!.serialNumber),
          _richTextLine("MODEL: ", elevator!.model.toUpperCase()),
          _richTextLine("TYPE: ", elevator!.types.toUpperCase()),
          _richTextLine("CREATED AT: ", elevator!.created_at.substring(0, 10)),
        ],
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [_boxShadow()]),
    );
  }

  Widget _richTextLine(String label, String content) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: RichText(
          text: TextSpan(
              text: label,
              style: GoogleFonts.lato(
                  textStyle: const TextStyle(
                      color: Colors.blue, fontSize: 25, fontWeight: FontWeight.bold)),
              children: <TextSpan>[
            TextSpan(
                text: content,
                style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold, color: Colors.red)))
          ])),
    );
  }

  void _updateFail() {
    Get.back();
    Get.snackbar(_labels.ops, _messages.errorUpdateTryAgain,
        backgroundColor: Colors.red, colorText: Colors.white);
  }

  Future<void> _updateSucess(String elevatorStatus) async {
    Get.back();
    elevator!.status = elevatorStatus;
    await Future.delayed(Duration(milliseconds: _properties.delayStatusElevator))
        .whenComplete(() => Get.back());
  }

  BoxShadow _boxShadow() => BoxShadow(
        color: Colors.grey,
        spreadRadius: 3,
        offset: Offset(1.0, 1.0),
        blurRadius: 5.0,
      );
}
// @override
// Widget build(BuildContext context) {
//   _controller.elevatorStatusObs.value = _elevator.status;
//
//   return Scaffold(
//       appBar: AppBar(
//           title: Text("Elevator ID: ${_elevator.id.toString()}"), centerTitle: true),
//       body: Center(
//           child: Column(children: [
//         Flexible(fit: FlexFit.tight, child: _infoListCard()),
//         Flexible(
//             fit: FlexFit.tight,
//             child: Container(
//                 alignment: Alignment.center,
//                 child: Obx(
//                   () => InkWell(
//                       child: _button(),
//                       onTap: () {
//                         _modalConfirmation(context);
//                       }),
//                 )))
//       ])));
// }