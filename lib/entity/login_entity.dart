import 'package:json_annotation/json_annotation.dart';
part 'login_entity.g.dart';

@JsonSerializable()
class LoginEntity {
  LoginEntity(
    this.phone,
    this.tel_code,
  );

  String phone;
  String tel_code;

  factory LoginEntity.fromJson(Map<String, dynamic> json) => _$LoginEntityFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, String> toJson() => _$LoginEntityToJson(this);
}
