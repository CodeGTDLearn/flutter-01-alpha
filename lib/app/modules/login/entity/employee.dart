import 'package:json_annotation/json_annotation.dart';

part 'employee.g.dart';

// flutter pub run build_runner watch
// flutter pub run build_runner build
// flutter pub run build_runner build --delete-conflicting-outputs
@JsonSerializable()
class Employee {
  int id;
  String first_name;
  String last_name;
  String title;
  String email;
  String created_at;
  String updated_at;
  int user_id;

  Employee(
    this.id,
    this.first_name,
    this.last_name,
    this.title,
    this.email,
    this.created_at,
    this.updated_at,
    this.user_id,
  );

  factory Employee.fromJson(Map<String, dynamic> json) => _$EmployeeFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeeToJson(this);
}