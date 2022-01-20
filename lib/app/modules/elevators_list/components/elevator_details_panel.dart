import 'package:flutter/material.dart';
import 'package:flutter_01_alpha/app/modules/elevators_list/entity/elevator.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/instance_manager.dart';
import 'package:google_fonts/google_fonts.dart';

class ElevatorDetailsPanel {
  Container create(Elevator elevator) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(Get.context!).size.width * 0.8,
      padding: const EdgeInsets.all(15),

      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _richTextLine("S/N: ", elevator.serialNumber),
            _richTextLine("MODEL: ", elevator.model.toUpperCase()),
            _richTextLine("TYPE: ", elevator.types.toUpperCase()),
            _richTextLine("CREATED AT: ", elevator.created_at.substring(0, 10)),
          ],
        ),
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

    return Container(
      width: MediaQuery.of(Get.context!).size.height * 0.7,
      child: FittedBox(
        child: Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: RichText(
                text: TextSpan(
                    text: label,
                    style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                            color: Colors.blue,
                            fontSize: 25,
                            fontWeight: FontWeight.bold)),
                    children: <TextSpan>[
                  TextSpan(
                      text: content,
                      style: GoogleFonts.lato(
                          textStyle: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.red)))
                ]))),
      ),
    );
  }
}