// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';

import '../properties.dart';

// ignore: must_be_immutable
class TimerMessageIndicatorAdaptive extends StatefulWidget {
  final _properties = Get.find<Properties>();
  double? radius;
  String? message;
  double? fontSize;
  bool _showCircularProgressIndicator = true;

  TimerMessageIndicatorAdaptive.message({required this.message, required this.fontSize});

  TimerMessageIndicatorAdaptive.radius([this.radius]);

  TimerMessageIndicatorAdaptive();

  @override
  _TimerMessageIndicatorAdaptiveState createState() => _TimerMessageIndicatorAdaptiveState();
}

class _TimerMessageIndicatorAdaptiveState extends State<TimerMessageIndicatorAdaptive> {
  @override
  void initState() {
    super.initState();
    if (widget.message != null) _timer();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.radius ?? MediaQuery.of(context).size.width,
      height: widget.radius ?? MediaQuery.of(context).size.height,
      alignment: Alignment.center,
      child: widget._showCircularProgressIndicator
          ? const CircularProgressIndicator.adaptive()
          : Text('${widget.message!}|View: Adaptive', style: TextStyle(fontSize:
      widget.fontSize)),
    );
  }

  void _timer() async {
    await Future.delayed(Duration(seconds: widget._properties.custProgDelay));
    if (mounted) setState(() => widget._showCircularProgressIndicator = false);
  }
}