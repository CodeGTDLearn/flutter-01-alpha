import 'dart:io';

import 'package:flutter/material.dart';

import 'i_sliver_appbar.dart';

// ignore: avoid_classes_with_only_static_members
class SliverAppBarMaterial implements ISliverAppBar {
  @override
  SliverAppBar create(
    String title, {
    Function? trailingFunction,
    IconData? trailingIcon = Icons.arrow_back,
  }) {
    final _platform = Platform.operatingSystem;
    return SliverAppBar(
      title: Text( '$title|View:$_platform'),
      automaticallyImplyLeading: false,
      actions:
      [
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: GestureDetector(
            child: Icon(trailingIcon),
            onTap: () => trailingFunction!.call(),
          ),
        )
      ],
    );
  }
}