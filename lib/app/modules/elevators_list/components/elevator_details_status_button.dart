import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_01_alpha/app/modules/elevators_list/entity/elevator.dart';
import 'package:google_fonts/google_fonts.dart';

import '../elevator_list_controller.dart';

class ElevatorDetailsStatusButton {
  AnimatedContainer create(
    context,
    ElevatorListController controller,
    Elevator elevator,
  ) {
    var _responsiveHeight = MediaQuery.of(context).size.height * 0.12;
    var _responsiveWidth = MediaQuery.of(context).size.width * 0.85;
    return AnimatedContainer(
        duration: const Duration(milliseconds: 1000),
        margin: const EdgeInsets.all(20),
        alignment: Alignment.center,
        curve: Curves.ease,
        height: _responsiveHeight,
        width: _responsiveWidth,
        transform: (controller.buttonScaleObs.value
            ? (Matrix4.identity()
              ..translate(0.025 * _responsiveWidth,
                  0.025 * _responsiveHeight) // translate towards right and down
              ..scale(0.95,
                  0.95)) // scale with to 95% anchorred at topleft of the AnimatedContainer
            : Matrix4.identity()),
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: controller.buttonColorObs.value,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                  color: controller.buttonColorObs.value,
                  blurRadius: controller.buttonShadowBlurObs.value)
            ]),
        child: DefaultTextStyle(
            style: GoogleFonts.roboto(
                textStyle: const TextStyle(fontSize: 50, color: Colors.white)),
            child: AnimatedTextKit(
                pause: const Duration(milliseconds: 500),
                totalRepeatCount: 20,
                animatedTexts: [
                  RotateAnimatedText(controller.buttonLabelStatusObs.value)
                ],
                onTap: () async => await controller.changingStatus(
                      context,
                      elevator,
                    ))));
    // onTap: () async => await controller.changingElevatorStatus(context))));
  }
}