// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SignUpParams _$SignUpParamsFromJson(Map<String, dynamic> json) =>
    _SignUpParams(
      email: json['email'] as String,
      password: json['password'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$SignUpParamsToJson(_SignUpParams instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'name': instance.name,
    };
