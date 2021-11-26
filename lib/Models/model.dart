import 'package:grocestore/Models/productModel.dart';

import 'fieldsModel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'model.g.dart';

@JsonSerializable()
class Model {
  var id;
  FieldsModel fields;
 

  Model({this.id, this.fields});
  factory Model.fromJson(var json) => _$ModelFromJson(json);
  Map<String, dynamic> toJson() => _$ModelToJson(this);
}
