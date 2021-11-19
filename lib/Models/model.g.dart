// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Model _$ModelFromJson(Map<String, dynamic> json) {
  return Model(
    id: json['id'] as int,
    fields: json['fields'] == null
        ? null
        : FieldsModel.fromJson(json['fields'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ModelToJson(Model instance) => <String, dynamic>{
      'id': instance.id,
      'fields': instance.fields,
    };
