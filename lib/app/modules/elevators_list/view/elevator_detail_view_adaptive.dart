import 'dart:io';

import 'package:animated_neumorphic/animated_neumorphic.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
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

import '../elevator_list_controller.dart';

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
    _controller.buttonLabelStatusObs.value = elevator!.status;

    return PlatformScaffold(
        appBar: PlatformAppBar(title: Text("Elevator ID: ${elevator!.id.toString()}")),
        body: Center(
            child: Column(children: [
          Flexible(fit: FlexFit.tight, child: _elevatorDetailsPanel()),
          Flexible(
              fit: FlexFit.tight,
              child: Container(
                  alignment: Alignment.center,
                  color: Colors.transparent,
                  child: Obx(() => GestureDetector(
                      child: _elevatorStatusButton(context),
                      onTap: () async => await _changingElevatorStatus(context)))))
        ])));
  }

  Future<void> _modalToConfirmElevatorStatusChange(context) async {
    return _modal.create(
      context,
      _messages.confirmation,
      _labels.yes,
      _labels.no,
      () async {
        await _controller
            .updateElevatorStatus(elevator!.id.toString())
            .then((status) async {
          if (status == 'online') await _elevatorUpdateSucessClosingTheModal(status);
          if (status == 'error') _elevatorUpdateFailingImpedingTheElevatorUpdate();
        });
      },
      () {
        _controller.elevatorStatusButtonAnimation(color: Colors.red, blur: 15);
        Get.back();
        // _controller.buttonColorObs.value == Colors.red;
        // _controller.buttonShadowBlurObs.value == 0;
      },
    );
  }

  AnimatedContainer _elevatorStatusButton(context) {
    var _responsiveHeight = MediaQuery.of(context).size.height * 0.12;
    var _responsiveWidth = MediaQuery.of(context).size.width * 0.85;
    return AnimatedContainer(
        duration: const Duration(milliseconds: 1000),
        margin: const EdgeInsets.all(20),
        alignment: Alignment.center,
        curve: Curves.ease,
        height: _responsiveHeight,
        width: _responsiveWidth,
        transform: (_controller.buttonScaleObs.value
            ? (Matrix4.identity()
              ..translate(0.025 * _responsiveWidth,
                  0.025 * _responsiveHeight) // translate towards right and down
              ..scale(0.95,
                  0.95)) // scale with to 95% anchorred at topleft of the AnimatedContainer
            : Matrix4.identity()),
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: _controller.buttonColorObs.value,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                  color: _controller.buttonColorObs.value,
                  blurRadius: _controller.buttonShadowBlurObs.value)
            ]),
        child: DefaultTextStyle(
            style: GoogleFonts.roboto(
                textStyle: const TextStyle(fontSize: 50, color: Colors.white)),
            child: AnimatedTextKit(
                totalRepeatCount: 20,
                animatedTexts: [
                  RotateAnimatedText(_controller.buttonLabelStatusObs.value)
                ],
                onTap: () async => await _changingElevatorStatus(context))));
  }

  Future<void> _changingElevatorStatus(context) async {
    _controller.elevatorStatusButtonAnimation(color: Colors.red, blur: 0);
    await Future.delayed(const Duration(milliseconds: 1000));
    _modalToConfirmElevatorStatusChange(context);
  }

  Container _elevatorDetailsPanel() {
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
          boxShadow: const [
            BoxShadow(
                color: Colors.grey,
                spreadRadius: 3,
                offset: Offset(1.0, 1.0),
                blurRadius: 5.0)
          ]),
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
            ])));
  }

  void _elevatorUpdateFailingImpedingTheElevatorUpdate() {
    Get.back();
    Get.snackbar(_labels.ops, _messages.errorUpdateTryAgain,
        backgroundColor: Colors.red, colorText: Colors.white);
  }

  Future<void> _elevatorUpdateSucessClosingTheModal(String elevatorStatus) async {
    Get.back(); // close modal
    elevator!.status = elevatorStatus;
    _controller.elevatorStatusButtonAnimation(color: Colors.green, blur: 15);
    await Future.delayed(Duration(milliseconds: _properties.delayStatusElevator))
        .whenComplete(() {
      Get.back();
      _controller.elevatorStatusButtonAnimation(color: Colors.red, blur: 15);
    });
  }
}