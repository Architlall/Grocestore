import 'package:grocestore/Models/cfieldsModel.dart';

import 'fieldsModel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'model.g.dart';

@JsonSerializable()
class Model {
  int id;
  FieldsModel fields;
  CfieldsModel cfields;

  Model({this.id, this.fields, this.cfields});
  factory Model.fromJson(Map<String, dynamic> json) => _$ModelFromJson(json);
  Map<String, dynamic> toJson() => _$ModelToJson(this);
}
