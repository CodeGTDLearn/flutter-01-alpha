import 'package:flutter/material.dart';

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
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
        const Text('99999999:'),
        Text('$_counter', style: Theme.of(context).textTheme.headline4)
      ])),
      floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter, child: const Icon(Icons.add)),
    );
  }
}