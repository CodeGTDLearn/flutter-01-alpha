// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppCoreLocalizationProperties {

  // APP-LOCALIZATIONS
  var localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    DefaultMaterialLocalizations.delegate,
    DefaultWidgetsLocalizations.delegate,
    DefaultCupertinoLocalizations.delegate,
  ];
}