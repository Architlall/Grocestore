import 'package:json_annotation/json_annotation.dart';

part 'cfieldsModel.g.dart';

@JsonSerializable()
class CfieldsModel {
  String user_phone;
  String user_address;
  String user_city;
  String user_email;

  CfieldsModel(
      {
      this.user_phone,
      this.user_address,
      this.user_city,
      this.user_email});
  factory CfieldsModel.fromJson(Map<String, dynamic> json) =>
      _$CfieldsModelFromJson(json);
  Map<String, dynamic> toJson() => _$CfieldsModelToJson(this);
}
