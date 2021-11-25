// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customerModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerModel _$CustomerModelFromJson(Map<String, dynamic> json) {
  return CustomerModel(
    records: (json['records'] as List)
        ?.map(
            (e) => e == null ? null : Model.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$CustomerModelToJson(CustomerModel instance) =>
    <String, dynamic>{
      'records': instance.records,
    };
