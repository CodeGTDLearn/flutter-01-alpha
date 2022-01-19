import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_01_alpha/app/core/properties.dart';
import 'package:flutter_01_alpha/app/modules/elevators_list/entity/elevator.dart';
import 'package:flutter_01_alpha/app/modules/elevators_list/view/elevator_detail_view_adaptive.dart';
import 'package:get/instance_manager.dart';

import 'i_animated_tile.dart';

class AnimatedTileMaterial implements IAnimatedListTile {
  final _properties = Get.find<Properties>();

  @override
  Widget tile(Elevator elevator, [BuildContext? context]) {
    return OpenContainer(
        closedElevation: 0,
        transitionDuration: Duration(milliseconds: _properties.delayListTile),
        transitionType: ContainerTransitionType.fadeThrough,
        openBuilder: (context, void Function({Object? returnValue}) openContainer) {
          return ElevatorDetailViewAdaptive(elevator: elevator);
        },
        closedBuilder: (_context, void Function() openContainer) {
          return Card(
              elevation: 5,
              margin: const EdgeInsets.fromLTRB(20, 10, 20, 7),
              child: ListTile(
                leading: CircleAvatar(
                    child: Text(elevator.id.toString(),
                        style: const TextStyle(fontWeight: FontWeight.w500)),
                    backgroundColor: Colors.blue),
                title: Text(" Model: ${elevator.model}"),
                subtitle: Text("Type: ${elevator.types}"),
                trailing: const Icon(Icons.info_sharp),
              ));
        });
  }
}