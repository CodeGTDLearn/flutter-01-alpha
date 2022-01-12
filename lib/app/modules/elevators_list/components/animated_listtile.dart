import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_01_alpha/app/core/animations_utils.dart';
import 'package:flutter_01_alpha/app/core/labels.dart';
import 'package:flutter_01_alpha/app/core/message_labels.dart';
import 'package:flutter_01_alpha/app/core/properties.dart';
import 'package:flutter_01_alpha/app/modules/elevators_list/entity/elevator.dart';
import 'package:flutter_01_alpha/app/modules/elevators_list/view/elevator_detail_view.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';

class AnimatedListTile {
  final _properties = Get.find<Properties>();
  final _animations = Get.find<AnimationsUtils>();
  final _messages = Get.find<MessageLabels>();
  final _labels = Get.find<Labels>();

  @override
  Widget customListTile(Elevator _elevator) {
    return OpenContainer(
      transitionDuration: Duration(milliseconds: _properties.delay_listtile),
      transitionType: ContainerTransitionType.fadeThrough,
      openBuilder: (context, void Function({Object? returnValue}) openContainer) {
        return ElevatorDetailView(_elevator);
      },
      closedBuilder: (context, void Function() openContainer) {
        return ListTile(
          // leading: _animations.openContainer(
          //     openingWidget: InventoryImageView(_elevator.title, _elevator.imageUrl),
          //     closingWidget:
          //         CircleAvatar(backgroundImage: NetworkImage(_elevator.imageUrl))),
          title: Text(
            "${_elevator.id} - ${_elevator.serialNumber} - ${_elevator.model} - "
            "${_elevator.types}",
          ),
          // trailing: Container(
          //     width: 100,
          //     child: Row(children: <Widget>[
          //       IconButton(
          //           icon: const Icon(Icons.edit),
          //           onPressed: openContainer,
          //           color: Theme.of(context).errorColor),
          //     ])),
        );
      },
    );
  }
}