// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginEntity _$LoginEntityFromJson(Map<String, dynamic> json) => LoginEntity(
      json['tel_code'] ?? "",
      json['phone'] ?? "",
    );

Map<String, String> _$LoginEntityToJson(LoginEntity instance) => <String, String>{
      'tel_code': instance.tel_code,
      'phone': instance.phone,
    };
