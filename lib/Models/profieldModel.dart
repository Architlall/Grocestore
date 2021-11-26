import 'package:grocestore/Models/productModel.dart';
import 'package:json_annotation/json_annotation.dart';
import 'model.dart';

part 'profieldModel.g.dart';

@JsonSerializable()
class ProfieldModel {
  var id;
  var url;

  ProfieldModel(
      {
        this.id,
        this.url
      });
  factory ProfieldModel.fromJson(var json) =>
      _$ProfieldModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProfieldModelToJson(this);
}
