import 'package:flutter/widgets.dart';
import 'package:flutter_01_alpha/app/modules/elevators_list/components/animated_tile.dart';
import 'package:flutter_01_alpha/app/modules/elevators_list/entity/elevator.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class SliverListview {
  final delayMilliseconds = 600;
  final double verticalOffset = 300.0;

  SliverListview({
    delayMilliseconds,
    verticalOffset,
  });

  @override
  Widget elevators(List<Elevator> elevators) {
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
                    child:
                        AnimatedTile().tile(elevators.elementAt(index)))));
      },
      childCount: elevators.length,
    )));
  }
}