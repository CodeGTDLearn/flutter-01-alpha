import 'package:flutter/material.dart';
import 'package:flutter_01_alpha/app/modules/home/home_view_label.dart';

import 'h_v_button.dart';

class HomeView extends StatefulWidget {
  HomeView(this.title);

  final String title;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _counter = 0;

  void _incrementCounter() => setState(() => _counter++);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            HomeViewLabel(),
            Text('$_counter', style: Theme.of(context).textTheme.headline4)
          ],
        )),
        floatingActionButton: HVButton().button(_incrementCounter));
  }
}