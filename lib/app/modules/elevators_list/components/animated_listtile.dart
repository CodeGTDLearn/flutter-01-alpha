import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_01_alpha/app/core/properties.dart';
import 'package:flutter_01_alpha/app/modules/elevators_list/entity/elevator.dart';
import 'package:flutter_01_alpha/app/modules/elevators_list/view/material/elevator_detail_view_material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';

class AnimatedListTile {
  final _properties = Get.find<Properties>();

  @override
  Widget tile(Elevator _elevator) {
    return OpenContainer(
        transitionDuration: Duration(milliseconds: _properties.delay_listtile),
        transitionType: ContainerTransitionType.fadeThrough,
        openBuilder: (context, void Function({Object? returnValue}) openContainer) {
          return ElevatorDetailViewMaterial(_elevator);
        },
        closedBuilder: (context, void Function() openContainer) {
          return Card(
              elevation: 5,
              margin: const EdgeInsets.fromLTRB(20, 10, 20, 7),
              child: ListTile(
                leading: CircleAvatar(
                    child: Text(_elevator.id.toString(),
                        style: const TextStyle(fontWeight: FontWeight.w500)),
                    backgroundColor: Colors.blue),
                title: Text(" Model: ${_elevator.model}"),
                subtitle: Text("Type: ${_elevator.types}"),
                trailing: const Icon(Icons.info_sharp),
              ));
        });
  }
}