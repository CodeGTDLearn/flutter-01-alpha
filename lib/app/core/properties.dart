import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Properties {
  final String _APP_NAME = "Rocket Elevators";
  final String _APP_LOGIN_IMAGE_BUTTON = "assets/elevator-btn.png";
  // final String _APP_LOGIN_IMAGE_BUTTON = "assets/test-img.png";
  final String _APP_TITLE = 'Rocket Elevators Mobile';
  final String _API_ROOT_URL = "https://jt-rocket-rest-api.herokuapp.com";
  final String _API_EMPLOYEE_ENDPOINT = "/api/employees";
  final String _API_NOT_ONLINE_ELEVATORS_ENDPOINT = "/api/elevators/NotOnline";
  final String _API_ELEVATOR_UPDATE_ENDPOINT = "/api/elevators/";
  final String _IMAGE_LOGO_URL = "assets/logo.png";
  final int _CUSTOM_PROGRESS_INDICICATOR_DELAY = 2;
  final int _DELAY_MILLISEC_LISTVIEW = 600;
  final int _DELAY_MILLISEC_LISTTILE = 600;
  final int _DELAY_MILLISEC_STATUS_ELEVATOR = 2000;
  final double _VERTICAL_OFFSET_LISTVIEW = 300.0;
  final localizationsDelegates2 = <LocalizationsDelegate<dynamic>>[
    DefaultMaterialLocalizations.delegate,
    DefaultWidgetsLocalizations.delegate,
    DefaultCupertinoLocalizations.delegate,
  ];
  final _APP_CONTEXT_GLOBAL_KEY = GlobalKey<NavigatorState>();


  String get appLoginImgBtn => _APP_LOGIN_IMAGE_BUTTON;

  get contextGkey => _APP_CONTEXT_GLOBAL_KEY;

  int get delayListView => _DELAY_MILLISEC_LISTVIEW;

  int get delayListTile => _DELAY_MILLISEC_LISTTILE;

  int get delayStatusElevator => _DELAY_MILLISEC_STATUS_ELEVATOR;

  String get employeeEndp => "$_API_ROOT_URL$_API_EMPLOYEE_ENDPOINT";

  String get notOnlineElevatorsEndp =>
      "$_API_ROOT_URL$_API_NOT_ONLINE_ELEVATORS_ENDPOINT";

  String get appName => _APP_NAME;

  String get appTitle => _APP_TITLE;

  int get custProgDelay => _CUSTOM_PROGRESS_INDICICATOR_DELAY;

  String get appLogo => _IMAGE_LOGO_URL;

  double get offsetListView => _VERTICAL_OFFSET_LISTVIEW;

  String get updateEndp => "$_API_ROOT_URL$_API_ELEVATOR_UPDATE_ENDPOINT";
}