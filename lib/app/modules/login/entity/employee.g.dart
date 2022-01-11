// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Employee _$EmployeeFromJson(Map<String, dynamic> json) => Employee(
      json['id'] as int,
      json['first_name'] as String,
      json['last_name'] as String,
      json['title'] as String,
      json['email'] as String,
      json['created_at'] as String,
      json['updated_at'] as String,
      json['user_id'] as int,
    );

Map<String, dynamic> _$EmployeeToJson(Employee instance) => <String, dynamic>{
      'id': instance.id,
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'title': instance.title,
      'email': instance.email,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'user_id': instance.user_id,
    };
