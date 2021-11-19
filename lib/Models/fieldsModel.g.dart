// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fieldsModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FieldsModel _$FieldsModelFromJson(Map<String, dynamic> json) {
  return FieldsModel(
    user_id: json['user_id'] as int,
    user_name: json['user_name'] as String,
    user_phone: json['user_phone'] as String,
    order_id: json['order_id'] as int,
    order_status: json['order_status'] as String,
    delivery_status: json['delivery_status'] as String,
    product_ordered: json['product_ordered'],
    quantity_ordered: json['quantity_ordered'],
    user_address: json['user_address'] as String,
    user_city: json['user_city'] as String,
    user_email: json['user_email'] as String,
  );
}

Map<String, dynamic> _$FieldsModelToJson(FieldsModel instance) =>
    <String, dynamic>{
      'user_id': instance.user_id,
      'order_id': instance.order_id,
      'user_name': instance.user_name,
      'user_phone': instance.user_phone,
      'order_status': instance.order_status,
      'delivery_status': instance.delivery_status,
      'user_address': instance.user_address,
      'user_city': instance.user_city,
      'user_email': instance.user_email,
      'product_ordered': instance.product_ordered,
      'quantity_ordered': instance.quantity_ordered,
    };
