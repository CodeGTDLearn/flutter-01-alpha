// ignore_for_file: constant_identifier_names, non_constant_identifier_names

class AppCoreDelayProperties {
  // APP-TIME-INTERVALS
  static const int _CUSTOM_PROGRESS_INDICATOR_DELAY = 2;
  static const int _DELAY_MILLISEC_LISTVIEW = 600;
  static const int _DELAY_MILLISEC_LISTTILE = 600;
  static const int _DELAY_MILLISEC_STATUS_ELEVATOR = 3000;
  static const double _VERTICAL_OFFSET_LISTVIEW = 300.0;

  get delayListView => _DELAY_MILLISEC_LISTVIEW;

  get delayListTile => _DELAY_MILLISEC_LISTTILE;

  get delayStatusElevator => _DELAY_MILLISEC_STATUS_ELEVATOR;

  get custProgDelay => _CUSTOM_PROGRESS_INDICATOR_DELAY;

  get offsetListView => _VERTICAL_OFFSET_LISTVIEW;
}