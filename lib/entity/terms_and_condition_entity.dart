import 'package:json_annotation/json_annotation.dart';

part 'terms_and_condition_entity.g.dart';

@JsonSerializable()
class TermsAndCondtionEntity {
  TermsAndCondtionEntity(this.id, this.title, this.content, this.published_at, this.enabled, this.created_at, this.updated_at);
  int id;
  String title;
  String content;
  String published_at;
  int enabled;
  String created_at;
  String updated_at;

  factory TermsAndCondtionEntity.fromJson(Map<String, dynamic> json) => _$TermsAndCondtionEntityFromJson(json);

  Map<String, dynamic> toJson() => _$TermsAndCondtionEntityToJson(this);
}
