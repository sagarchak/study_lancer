import 'package:json_annotation/json_annotation.dart';

part 'country_type_entity.g.dart';

@JsonSerializable()
class CountryTypeEntity {
  CountryTypeEntity(this.id, this.name, this.flag, this.image);
  int id;
  String name;
  String flag;
  String image;

  factory CountryTypeEntity.fromJson(Map<String, dynamic> json) => _$CountryTypeEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CountryTypeEntityToJson(this);
}
