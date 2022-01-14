import 'package:flutter/widgets.dart';

abstract class IAdaptiveSliverAppBar {
  Widget create(
    String title, {
    Function? trailingFunction,
    IconData? trailingIcon,
  });
}