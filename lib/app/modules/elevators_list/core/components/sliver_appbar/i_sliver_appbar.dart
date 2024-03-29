import 'package:flutter/widgets.dart';

abstract class ISliverAppBar {
  Widget create(
    String title, {
    Function trailingFunction,
    IconData trailingIcon,
  });
}