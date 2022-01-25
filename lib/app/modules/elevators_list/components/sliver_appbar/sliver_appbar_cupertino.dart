
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_01_alpha/app/core/text/labels.dart';
import 'package:get/instance_manager.dart';

import 'i_sliver_appbar.dart';

// ignore: avoid_classes_with_only_static_members
class SliverAppBarCupertino implements ISliverAppBar {
  final _labels = Get.find<Labels>();

  @override
  CupertinoSliverNavigationBar create(
    String title, {
    Function? trailingFunction,
    IconData? trailingIcon = CupertinoIcons.square_arrow_left,
  }) {
    final _platform = Platform.operatingSystem;
    return CupertinoSliverNavigationBar(
      largeTitle: Text(_labels.large_title),
      middle: Text( '$title|View:$_platform'),
      automaticallyImplyLeading: false,
      trailing: trailingFunction == null
          ? null
          : CupertinoButton(
              child: Icon(trailingIcon),
              onPressed: () => trailingFunction.call(),
            ),
    );
  }
}