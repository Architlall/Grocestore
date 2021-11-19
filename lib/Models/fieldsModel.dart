import 'package:json_annotation/json_annotation.dart';

part 'fieldsModel.g.dart';

@JsonSerializable()
class FieldsModel {
  int user_id;
  int order_id;
  String user_name;
  String user_phone;
  String order_status;
  String delivery_status;
  String user_address;
  String user_city;
  String user_email;
  var product_ordered;
  var quantity_ordered;

  FieldsModel(
      {this.user_id,
      this.user_name,
      this.user_phone,
      this.order_id,
      this.order_status,
      this.delivery_status,
      this.product_ordered,
      this.quantity_ordered,
      this.user_address,
      this.user_city,
      this.user_email}
      );
  factory FieldsModel.fromJson(Map<String, dynamic> json) =>
      _$FieldsModelFromJson(json);
  Map<String, dynamic> toJson() => _$FieldsModelToJson(this);
}
