
import 'package:flutter/widgets.dart';
import 'package:flutter_01_alpha/app/core/properties.dart';
import 'package:flutter_01_alpha/app/modules/elevators_list/entity/elevator.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

import 'animated_list_tile/i_animated_tile.dart';

class SliverListview {
  final delayMilliseconds = 600;
  final double verticalOffset = 300.0;
  final _properties = Get.find<Properties>();
  // final _animated = Get.find<IAnimatedListTile>(tag: Platform.operatingSystem);

  SliverListview({
    delayMilliseconds,
    verticalOffset,
  });

  Widget elevators(List<Elevator> elevators) {
  final _animated = Get.find<IAnimatedListTile>(tag: _properties.appPlatform);
    return AnimationLimiter(
        child: SliverList(
            delegate: SliverChildBuilderDelegate(
      (ctx, index) {
        return AnimationConfiguration.staggeredList(
            position: index,
            duration: Duration(milliseconds: delayMilliseconds),
            child: SlideAnimation(
                verticalOffset: verticalOffset,
                child: FadeInAnimation(
                    child: _animated.tile(elevators.elementAt(index)))));
      },
      childCount: elevators.length,
    )));
  }
}