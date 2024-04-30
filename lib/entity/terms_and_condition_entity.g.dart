// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'terms_and_condition_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TermsAndCondtionEntity _$TermsAndCondtionEntityFromJson(Map<String, dynamic> json) => TermsAndCondtionEntity(json['id'] ?? 0, json['title'] ?? "",
    json['content'] ?? "", json['published_at'] ?? "", json['enabled'] ?? 0, json['created_at'] ?? "", json['updated_at'] ?? "");

Map<String, dynamic> _$TermsAndCondtionEntityToJson(TermsAndCondtionEntity instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'published_at': instance.published_at,
      'enabled': instance.enabled,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
    };
