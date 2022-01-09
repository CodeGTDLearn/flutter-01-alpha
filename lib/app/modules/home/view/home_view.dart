import 'package:flutter/material.dart';
import 'package:flutter_01_alpha/app/modules/home/components/view_label.dart';
import 'package:flutter_01_alpha/app/modules/home/service/home_service.dart';

import '../components/view_button.dart';

class HomeView extends StatefulWidget {
  HomeView(this.title);

  final String title;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeService service = HomeService(contador: 0);

  int _counter = 0;

  void _incrementCounter() => setState(() => _counter = service.incrementador());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ViewLabel(),
            Text('$_counter', style: Theme.of(context).textTheme.headline4)
          ],
        )),
        floatingActionButton: ViewButton().button(_incrementCounter));
  }
}