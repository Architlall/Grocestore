// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListModel _$ListModelFromJson(Map<String, dynamic> json) {
  return ListModel(
    records: (json['records'] as List)
        ?.map(
            (e) => e == null ? null : Model.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ListModelToJson(ListModel instance) => <String, dynamic>{
      'records': instance.records,
    };
