// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fieldsModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FieldsModel _$FieldsModelFromJson(Map<String, dynamic> json) {
  return FieldsModel(
    order_id: json['order_id'] as int,
    user_id: json['user_id'] as int,
    user_name: json['user_name'] as String,
    order_status: json['order_status'] as String,
    delivery_status: json['delivery_status'] as String,
    product_ordered: json['product_ordered'],
    quantity_ordered: json['quantity_ordered'],
    user_phone: json['user_phone'],
    user_address: json['user_address'] as String,
    user_city: json['user_city'] as int,
    user_email: json['user_email'] as String,
    product_id: json['product_id'] as int,
    product_name: json['product_name'] as String,
    product_image: (json['product_image'] as List)
        ?.map((e) => e == null ? null : ProfieldModel.fromJson(e))
        ?.toList(),
  );
}

Map<String, dynamic> _$FieldsModelToJson(FieldsModel instance) =>
    <String, dynamic>{
      'order_id': instance.order_id,
      'user_id': instance.user_id,
      'user_name': instance.user_name,
      'order_status': instance.order_status,
      'delivery_status': instance.delivery_status,
      'product_ordered': instance.product_ordered,
      'quantity_ordered': instance.quantity_ordered,
      'user_phone': instance.user_phone,
      'user_address': instance.user_address,
      'user_city': instance.user_city,
      'user_email': instance.user_email,
      'product_id': instance.product_id,
      'product_name': instance.product_name,
      'product_image': instance.product_image,
    };
