import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_01_alpha/app/core/text/labels.dart';
import 'package:get/instance_manager.dart';

import 'i_adaptive_sliver_appbar.dart';

// ignore: avoid_classes_with_only_static_members
class SliverAppBarCupertino implements IAdaptiveSliverAppBar {
  final _labels = Get.find<Labels>();

  @override
  CupertinoSliverNavigationBar create(
    String title, {
    Function? trailingFunction,
    IconData? trailingIcon = CupertinoIcons.square_arrow_left,
  }) {
    return CupertinoSliverNavigationBar(
      largeTitle: Text(_labels.large_title),
      middle: Text(title),
      automaticallyImplyLeading: false,
      trailing: trailingIcon == null
          ? null
          : CupertinoButton(
              child: Icon(trailingIcon),
              onPressed: () => trailingFunction,
            ),
      // key: Key(_keys.k_sliver_appbar()),
      // leading: isBackTapNull ? null : CupertinoButton(
      //   child: const Icon(Icons.home),
      //   onPressed: () {},
      // ),
    );
  }
}