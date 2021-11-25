// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cfieldsModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CfieldsModel _$CfieldsModelFromJson(Map<String, dynamic> json) {
  return CfieldsModel(
    user_phone: json['user_phone'] as String,
    user_address: json['user_address'] as String,
    user_city: json['user_city'] as String,
    user_email: json['user_email'] as String,
  );
}

Map<String, dynamic> _$CfieldsModelToJson(CfieldsModel instance) =>
    <String, dynamic>{
      'user_phone': instance.user_phone,
      'user_address': instance.user_address,
      'user_city': instance.user_city,
      'user_email': instance.user_email,
    };
