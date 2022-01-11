class Properties {
  final String _APP_NAME = "Rocket Elevators";
  final String _APP_TITLE = 'Rocket Elevators Mobile';
  final String _EMPLOYEE_DB_URL = "https://jt-rocket-rest-api.herokuapp.com/api/employees";

  String get employee_db_url => _EMPLOYEE_DB_URL;

  String appName() {
    return _APP_NAME;
  }

  String appTitle() {
    return _APP_TITLE;
  }
}