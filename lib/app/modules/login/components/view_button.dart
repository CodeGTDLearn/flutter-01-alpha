import 'package:flutter/material.dart';

class ViewButton {

  FloatingActionButton button(Function somar) {
    return FloatingActionButton(
      onPressed: () => somar.call(),
      child: const Icon(Icons.add),
    );
  }
}