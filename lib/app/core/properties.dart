import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Properties {
  final String _APP_NAME = "Rocket Elevators";
  final String _APP_TITLE = 'Rocket Elevators Mobile';
  final String _API_ROOT_URL = "https://jt-rocket-rest-api.herokuapp.com";
  final String _API_EMPLOYEE_ENDPOINT = "/api/employees";
  final String _API_NOT_ONLINE_ELEVATORS_ENDPOINT = "/api/elevators/NotOnline";
  final String _API_ELEVATOR_UPDATE_ENDPOINT = "/api/elevators/";
  final String _IMAGE_LOGO_URL = "assets/logo.png";
  final int _CUSTOM_PROGRESS_INDICICATOR_DELAY = 2;
  final  int _DELAY_MILLISEC_LISTVIEW = 600;
  final  int _DELAY_MILLISEC_LISTTILE = 600;
  final  int _DELAY_MILLISEC_STATUS_ELEVATOR = 2000;
  final  double _VERTICAL_OFFSET_LISTVIEW = 300.0;
  final localizationsDelegates2 = <LocalizationsDelegate<dynamic>>[
    DefaultMaterialLocalizations.delegate,
    DefaultWidgetsLocalizations.delegate,
    DefaultCupertinoLocalizations.delegate,
  ];


  int get delay_listview => _DELAY_MILLISEC_LISTVIEW;

  int get delay_listtile => _DELAY_MILLISEC_LISTTILE;

  int get delay_status_elevator => _DELAY_MILLISEC_STATUS_ELEVATOR;

  String get employee_endp => "$_API_ROOT_URL$_API_EMPLOYEE_ENDPOINT";

  String get notonline_elevators_endp => "$_API_ROOT_URL$_API_NOT_ONLINE_ELEVATORS_ENDPOINT";

  String get appName => _APP_NAME;

  String get appTitle => _APP_TITLE;

  int get cust_prog_delay => _CUSTOM_PROGRESS_INDICICATOR_DELAY;

  String get appLogo => _IMAGE_LOGO_URL;

  double get offset_listview => _VERTICAL_OFFSET_LISTVIEW;

  String get update_endp => "$_API_ROOT_URL$_API_ELEVATOR_UPDATE_ENDPOINT";
}