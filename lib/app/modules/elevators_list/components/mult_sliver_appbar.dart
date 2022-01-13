import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: avoid_classes_with_only_static_members
class MultSliverAppBar {
  Widget create() {
    return Platform.isIOS ? _cupertinoAppbar() : _materialAppbar();
  }

  // final _keys = Get.find<GlobalWidgetsKeys>();
  SliverAppBar _materialAppbar(String title, {
    Function? backTapFunction,
    IconData icon = Icons.arrow_back,
    List<Widget>? actions,
  }) {
    Platform.isIOS;
    return SliverAppBar(
        floating: true,
        // key: Key(_keys.k_sliver_appbar()),
        title: Text(title),
        automaticallyImplyLeading: false,
        // leading: GestureDetector(
        //   onTap: () => backTapFunction.call(),
        //   child: Icon(icon),
        // )
        actions: actions);
  }

  CupertinoSliverNavigationBar _cupertinoAppbar() {
    return CupertinoSliverNavigationBar(
      // leading: Material(
      //     child: IconButton(
      //   icon: const Icon(Icons.home),
      //   onPressed: () {},
      // )),
      middle: const Text(title),
      trailing: CupertinoButton(
          child: const Icon(icon)
          onPressed: () {},
    ),
    largeTitle: const Text('Large Title'),
    );
  }
}