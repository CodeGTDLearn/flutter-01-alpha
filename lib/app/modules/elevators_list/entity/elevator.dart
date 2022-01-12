import 'package:json_annotation/json_annotation.dart';

part 'elevator.g.dart';

// flutter pub run build_runner watch
// flutter pub run build_runner build
// flutter pub run build_runner build --delete-conflicting-outputs
@JsonSerializable()
class Elevator {
  int id;
  String serialNumber;
  String model;
  String types;
  String status;
  String created_at;

  Elevator(
    this.id,
    this.serialNumber,
    this.model,
    this.types,
    this.status,
    this.created_at,
  );

  factory Elevator.fromJson(Map<String, dynamic> json) => _$ElevatorFromJson(json);

  Map<String, dynamic> toJson() => _$ElevatorToJson(this);
}