import 'package:json_annotation/json_annotation.dart';
part 'country_code_entity.g.dart';

@JsonSerializable()
class CountryCodeEntity {
  CountryCodeEntity(
    this.id,
    this.name,
    this.code,
    this.created_at,
    this.flag,
    this.tel_code,
    this.timezone,
    this.updated_at,
  );

  int id;
  String name;
  String code;
  String tel_code;
  String timezone;
  String flag;
  String created_at;
  String updated_at;

  factory CountryCodeEntity.fromJson(Map<String, dynamic> json) => _$CountryCodeEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CountryCodeEntityToJson(this);
}
