
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_01_alpha/app/core/platforms/cupertino_styles.dart';
import 'package:flutter_01_alpha/app/core/text/app_core_labels.dart';
import 'package:get/instance_manager.dart';

import 'i_sliver_appbar.dart';

// ignore: avoid_classes_with_only_static_members
class SliverAppBarCupertino implements ISliverAppBar {
  final _labels = Get.find<AppCoreLabels>();

  @override
  CupertinoSliverNavigationBar create(
    String title, {
    Function? trailingFunction,
    IconData? trailingIcon = CupertinoIcons.square_arrow_left,
  }) {
    final _platform = Platform.operatingSystem;
    return CupertinoSliverNavigationBar(
      largeTitle: Text(_labels.large_title, style:CupertinoStyles.superiorElevatorListText ),
      middle: Text( '$title|View:$_platform'),
      automaticallyImplyLeading: false,
      backgroundColor: CupertinoStyles.scaffoldColor,
      trailing: trailingFunction == null
          ? null
          : CupertinoButton(
              child: Icon(trailingIcon),
              onPressed: () => trailingFunction.call(),
            ),
    );
  }
}