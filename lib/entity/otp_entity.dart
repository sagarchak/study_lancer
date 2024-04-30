import 'package:json_annotation/json_annotation.dart';
part 'otp_entity.g.dart';

@JsonSerializable()
class OTPEntity {
  OTPEntity(
    this.phone,
    this.code,
  );

  String phone;
  String code;

  factory OTPEntity.fromJson(Map<String, dynamic> json) => _$OTPEntityFromJson(json);

  Map<String, String> toJson() => _$OTPEntityToJson(this);
}
