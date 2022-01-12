import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';

import '../properties.dart';

// ignore: must_be_immutable
class CustomIndicator extends StatefulWidget {
  final _properties = Get.find<Properties>();

  double? radius;
  String? message;
  double? fontSize;
  bool _showCircularProgressIndicator = true;



  CustomIndicator.message({required this.message, required this.fontSize});

  CustomIndicator.radius([this.radius]);

  CustomIndicator();

  @override
  _CustomIndicatorState createState() => _CustomIndicatorState();
}

class _CustomIndicatorState extends State<CustomIndicator> {
  @override
  void initState() {
    super.initState();
    if (widget.message != null) _timer();
  }

  @override
  void dispose() => super.dispose();

  void _timer() async {
    await Future.delayed(Duration(seconds: widget._properties.cust_prog_delay));

    if (mounted) {
      setState(() => widget._showCircularProgressIndicator = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.radius ?? MediaQuery.of(context).size.width,
      height: widget.radius ?? MediaQuery.of(context).size.height,
      alignment: Alignment.center,
      child: widget._showCircularProgressIndicator
          ? CircularProgressIndicator()
          : Text(widget.message!, style: TextStyle(fontSize: widget.fontSize)),
    );
  }
}