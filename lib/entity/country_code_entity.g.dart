// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_code_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountryCodeEntity _$CountryCodeEntityFromJson(Map<String, dynamic> json) => CountryCodeEntity(
      json['id'] ?? 0,
      json['name'] ?? "",
      json['code'] ?? "",
      json['created_at'] ?? "",
      json['flag'] ?? "",
      json['tel_code'] ?? "",
      json['timezone'] ?? "",
      json['updated_at'] ?? "",
    );

Map<String, dynamic> _$CountryCodeEntityToJson(CountryCodeEntity instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'tel_code': instance.tel_code,
      'timezone': instance.timezone,
      'flag': instance.flag,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
    };
