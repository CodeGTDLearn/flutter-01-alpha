// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppCoreProperties {
  // APP-GENERAL-SPECIFICATIONS
  final String _APP_PLATFORM = Platform.operatingSystem;

  static const String _APP_NAME = "Rocket Elevators";
  static const String _APP_TITLE = 'Rocket Elevators Mobile';
  final _APP_CONTEXT_GLOBAL_KEY = GlobalKey<NavigatorState>();

  get appPlatform => _APP_PLATFORM;

  get contextGkey => _APP_CONTEXT_GLOBAL_KEY;

  get appName => _APP_NAME;

  get appTitle => _APP_TITLE;
}