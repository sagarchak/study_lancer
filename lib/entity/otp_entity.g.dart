// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OTPEntity _$OTPEntityFromJson(Map<String, dynamic> json) => OTPEntity(
      json['phone'],
      json['code'],
    );

Map<String, String> _$OTPEntityToJson(OTPEntity instance) => <String, String>{
      'phone': instance.phone,
      'code': instance.code,
    };
