import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_01_alpha/app/core/platforms/cupertino_styles.dart';
import 'package:flutter_01_alpha/app/modules/elevators_list/entity/elevator.dart';
import 'package:flutter_01_alpha/app/modules/elevators_list/view/elevator_details_view_adaptive.dart';
import 'package:get/instance_manager.dart';

import '../../../elevator_list_controller.dart';
import 'i_animated_tile.dart';

class AnimatedTileCupertino implements IAnimatedListTile {
  final _controller = Get.find<ElevatorListController>();

  @override
  Widget tile(Elevator elevator) {
    return GestureDetector(
      child: Card(
          elevation: 5,
          margin: const EdgeInsets.fromLTRB(20, 10, 20, 7),
          child: ListTile(
            leading: CircleAvatar(
                child: Text(elevator.id.toString(),
                    style: const TextStyle(fontWeight: FontWeight.w500)),
                backgroundColor: CupertinoColors.systemBlue),
            title: Text(" Model: ${elevator.model}",style: CupertinoStyles.elevatorModel),
            subtitle: Text("Type: ${elevator.types}",style: CupertinoStyles.elevatorModel),
            trailing: const Icon(CupertinoIcons.info,color: CupertinoStyles.iconColor),
          )),
      onTap: () => showCupertinoDialog(
        context: _controller.elevatorListViewCupertinoContext,
        builder: (BuildContext context) {
          return CupertinoPopupSurface(
              child: ElevatorDetailsViewAdaptive(elevator: elevator));
        },
      ),
    );
  }
}