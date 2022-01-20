// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Employee _$EmployeeFromJson(Map<String, dynamic> json) => Employee(
      json['id'] as int,
      json['firstName'] as String,
      json['lastName'] as String,
      json['title'] as String,
      json['email'] as String,
      json['createdAt'] as String,
      json['updatedAt'] as String,
      json['userId'] as int,
    );

Map<String, dynamic> _$EmployeeToJson(Employee instance) => <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'title': instance.title,
      'email': instance.email,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'userId': instance.userId,
    };
