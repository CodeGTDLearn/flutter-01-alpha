// ignore_for_file: constant_identifier_names, non_constant_identifier_names


class AppCoreDatasourceUrls {

  // APP-API-URLS
  static const String _API_ROOT_URL = "https://jt-rocket-rest-api.herokuapp.com";
  // static const String _API_ROOT_URL = "https://test-lea-jonatas-default-rtdb.firebaseio.com";

  // static const String _API_ROOT_URL = "https://ad4705a0-b0c7-445c-bae1-a4353306dd65.mock.pstmn.io";
  static const String _API_EMPLOYEE_ENDPOINT = "/api/employees";
  static const String _API_NOT_ONLINE_ELEVATORS_ENDPOINT = "/api/elevators/NotOnline";
  static const String _API_ELEVATOR_UPDATE_ENDPOINT = "/api/elevators/";

  get apiRootUrl => _API_ROOT_URL;

  get employeeEndp => _API_EMPLOYEE_ENDPOINT;

  get notOnlineElevatorsEndp => _API_NOT_ONLINE_ELEVATORS_ENDPOINT;

  get updateEndp => _API_ELEVATOR_UPDATE_ENDPOINT;
}