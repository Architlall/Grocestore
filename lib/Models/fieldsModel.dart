import 'package:json_annotation/json_annotation.dart';

part 'fieldsModel.g.dart';

@JsonSerializable()
class FieldsModel {
  int order_id;
  String user_name;
  String order_status;
  String delivery_status;
  var product_ordered;
  var quantity_ordered;
  var user_phone;
  String user_address;
  var user_city;
  String user_email;

  FieldsModel({
    this.order_id,
    this.user_name,
    this.order_status,
    this.delivery_status,
    this.product_ordered,
    this.quantity_ordered,
    this.user_phone,
    this.user_address,
    this.user_city,
    this.user_email
  });
  factory FieldsModel.fromJson(Map<String, dynamic> json) =>
      _$FieldsModelFromJson(json);
  Map<String, dynamic> toJson() => _$FieldsModelToJson(this);
}
