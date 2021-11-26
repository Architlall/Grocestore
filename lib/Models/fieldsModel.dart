import 'package:grocestore/Models/productModel.dart';
import 'package:json_annotation/json_annotation.dart';
import 'profieldModel.dart';
part 'fieldsModel.g.dart';

@JsonSerializable()
class FieldsModel {
  int order_id;
  int user_id;
  String user_name;
  String order_status;
  String delivery_status;
  var product_ordered;
  var quantity_ordered;
  var user_phone;
  String user_address;
  int user_city;
  String user_email;
  int product_id;
  String product_name;
  List<ProfieldModel> product_image;

  FieldsModel({
    this.order_id,
    this.user_id,
    this.user_name,
    this.order_status,
    this.delivery_status,
    this.product_ordered,
    this.quantity_ordered,
    this.user_phone,
    this.user_address,
    this.user_city,
    this.user_email,
    this.product_id,
    this.product_name,
    this.product_image
  });
  factory FieldsModel.fromJson(var json) => _$FieldsModelFromJson(json);
  Map<String, dynamic> toJson() => _$FieldsModelToJson(this);
}
