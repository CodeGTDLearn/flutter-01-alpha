// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_01_alpha/app/core/properties/app_core_delay_properties.dart';
import 'package:get/instance_manager.dart';


// ignore: must_be_immutable
class AppCoreMessageIndicatorAdaptive extends StatefulWidget {
  final _delayProps = Get.find<AppCoreDelayProperties>();
  double? radius;
  String? message;
  double? fontSize;
  bool _showCircularProgressIndicator = true;

  AppCoreMessageIndicatorAdaptive.message({required this.message, required this.fontSize});

  AppCoreMessageIndicatorAdaptive.radius([this.radius]);

  AppCoreMessageIndicatorAdaptive();

  @override
  _AppCoreMessageIndicatorAdaptiveState createState() => _AppCoreMessageIndicatorAdaptiveState();
}

class _AppCoreMessageIndicatorAdaptiveState extends State<AppCoreMessageIndicatorAdaptive> {
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
    await Future.delayed(Duration(seconds: widget._delayProps.custProgDelay));
    if (mounted) setState(() => widget._showCircularProgressIndicator = false);
  }
}