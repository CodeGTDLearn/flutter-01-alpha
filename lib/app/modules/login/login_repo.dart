import 'package:flutter_01_alpha/app/core/properties.dart';
import 'package:get/instance_manager.dart';
import 'package:http/http.dart' as http;

class LoginRepo {
  final _properties = Get.find<Properties>();

  Future<bool> authentication(String email) {
    // @formatter:off
    return
      http
          .get(Uri.parse("${_properties.employee_endp}/$email"))
          .then((response) {
              return response.body == "true" ? true : false;
          })
          .catchError((onError) => throw onError);
    // @formatter:on
  }

// Future<List<Employee>> getEmployees() {
//   return http
//       .get(Uri.parse(_properties.employee_db_url),
//           headers: {"Accept": "application/json"})
//       .then(_decodeResponse)
//       .catchError((onError) => throw onError);
// }
//
// List<Employee> _decodeResponse(http.Response response) {
//   var _employees = <Employee>[];
//
//   var plainText = response.body;
//   final json = jsonDecode(plainText);
//   json == null
//       ? _employees = []
//       :
//       //Rahman
//       //    json.map<Employee>((resp) => Product.fromJson(resp)).toList();
//       // Paulo (anterior)
//       json.forEach((key, value) {
//           var employee = Employee.fromJson(value);
//           employee.id = key;
//           _employees.add(employee);
//         });
//   return _employees;
// }
}