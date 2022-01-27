import 'package:flutter/widgets.dart';
import 'package:flutter_01_alpha/app/modules/elevators_list/entity/elevator.dart';

abstract class IAnimatedListTile {
  Widget tile(Elevator elevator);
}