import 'package:json_annotation/json_annotation.dart';

part 'employee.g.dart';

// flutter pub run build_runner watch
// flutter pub run build_runner build
// flutter pub run build_runner build --delete-conflicting-outputs
@JsonSerializable()
class Employee {
  int id;
  String firstName;
  String lastName;
  String title;
  String email;
  String createdAt;
  String updatedAt;
  int userId;

  Employee(
    this.id,
    this.firstName,
    this.lastName,
    this.title,
    this.email,
    this.createdAt,
    this.updatedAt,
    this.userId,
  );

  factory Employee.fromJson(Map<String, dynamic> json) => _$EmployeeFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeeToJson(this);
}