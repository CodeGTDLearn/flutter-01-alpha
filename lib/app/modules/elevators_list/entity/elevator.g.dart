// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'elevator.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Elevator _$ElevatorFromJson(Map<String, dynamic> json) => Elevator(
      json['id'] as int,
      json['serialNumber'] as String,
      json['model'] as String,
      json['types'] as String,
      json['status'] as String,
      json['created_at'] as String,
    );

Map<String, dynamic> _$ElevatorToJson(Elevator instance) => <String, dynamic>{
      'id': instance.id,
      'serialNumber': instance.serialNumber,
      'model': instance.model,
      'types': instance.types,
      'status': instance.status,
      'created_at': instance.created_at,
    };
