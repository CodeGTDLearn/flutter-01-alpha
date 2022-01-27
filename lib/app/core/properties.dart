// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Properties {
  // APP-GENERAL-SPECIFICATIONS
  final String _APP_PLATFORM = Platform.operatingSystem;

  // static const String _APP_PLATFORM = "ios";
  static const String _APP_NAME = "Rocket Elevators";
  static const String _APP_TITLE = 'Rocket Elevators Mobile';
  final _APP_CONTEXT_GLOBAL_KEY = GlobalKey<NavigatorState>();

  // APP-ASSETS-IMAGES
  static const String _APP_LOGIN_IMAGE_BUTTON =
      "assets/login_view/elevator-btn-login-view.png";
  static const String _IMAGE_LOGO_URL = "assets/login_view/logo.png";
  static const String _CUPERTINO_CIRCULAR_PROGRESS_INDICATOR =
      "assets/splash/cupertino_activity_indicator_small.gif";
  static const String _MATERIAL_CIRCULAR_PROGRESS_INDICATOR =
      "assets/splash/circular_progress_indicator_small.gif";

  // APP-API-URLS
  // static const String _API_ROOT_URL = "https://jt-rocket-rest-api.herokuapp.com";
  static const String _API_ROOT_URL = "https://ad4705a0-b0c7-445c-bae1-a4353306dd65.mock.pstmn.io";
  static const String _API_EMPLOYEE_ENDPOINT = "/api/employees";
  static const String _API_NOT_ONLINE_ELEVATORS_ENDPOINT = "/api/elevators/NotOnline";
  static const String _API_ELEVATOR_UPDATE_ENDPOINT = "/api/elevators/";

  // APP-TIME-INTERVALS
  static const int _CUSTOM_PROGRESS_INDICATOR_DELAY = 2;
  static const int _DELAY_MILLISEC_LISTVIEW = 600;
  static const int _DELAY_MILLISEC_LISTTILE = 600;
  static const int _DELAY_MILLISEC_STATUS_ELEVATOR = 3000;
  static const double _VERTICAL_OFFSET_LISTVIEW = 300.0;

  // APP-LOCALIZATIONS
  var localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    DefaultMaterialLocalizations.delegate,
    DefaultWidgetsLocalizations.delegate,
    DefaultCupertinoLocalizations.delegate,
  ];

  get appPlatform => _APP_PLATFORM;

  get appLoginImgBtn => _APP_LOGIN_IMAGE_BUTTON;

  get contextGkey => _APP_CONTEXT_GLOBAL_KEY;

  get delayListView => _DELAY_MILLISEC_LISTVIEW;

  get delayListTile => _DELAY_MILLISEC_LISTTILE;

  get delayStatusElevator => _DELAY_MILLISEC_STATUS_ELEVATOR;

  get apiRootUrl => _API_ROOT_URL;

  get employeeEndp => _API_EMPLOYEE_ENDPOINT;

  get notOnlineElevatorsEndp => _API_NOT_ONLINE_ELEVATORS_ENDPOINT;

  get appName => _APP_NAME;

  get appTitle => _APP_TITLE;

  get custProgDelay => _CUSTOM_PROGRESS_INDICATOR_DELAY;

  get appLogo => _IMAGE_LOGO_URL;

  get offsetListView => _VERTICAL_OFFSET_LISTVIEW;

  get updateEndp => _API_ELEVATOR_UPDATE_ENDPOINT;

  get cupertinoIndicator => _CUPERTINO_CIRCULAR_PROGRESS_INDICATOR;

  get materialIndicator => _MATERIAL_CIRCULAR_PROGRESS_INDICATOR;
}