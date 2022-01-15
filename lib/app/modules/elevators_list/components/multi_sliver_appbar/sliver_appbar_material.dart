import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'i_adaptive_sliver_appbar.dart';

// ignore: avoid_classes_with_only_static_members
class SliverAppBarMaterial implements IAdaptiveSliverAppBar {
  @override
  SliverAppBar create(
    String title, {
    Function? trailingFunction,
    IconData? trailingIcon = Icons.arrow_back,
  }) {
    return SliverAppBar(
      title: Text(title),
      automaticallyImplyLeading: false,
      actions:
      [
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: GestureDetector(
            child: Icon(trailingIcon),
            onTap: () => trailingFunction,
          ),
        )
      ],
      // trailingIcon == null
      //     ? null
      //     : [
      //         Padding(
      //           padding: const EdgeInsets.only(right: 20.0),
      //           child: GestureDetector(
      //             child: Icon(trailingIcon),
      //             onTap: () => trailingFunction,
      //           ),
      //         )
      //       ],
      // key: Key(_keys.k_sliver_appbar()),
      // floating: true,
      // leading: GestureDetector(
      //   onTap: () => backTapFunction.call(),
      //   child: Icon(icon),
      // )
    );
  }
}