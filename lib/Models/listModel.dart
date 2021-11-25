import 'package:grocestore/customer.dart';
import 'package:json_annotation/json_annotation.dart';
import 'model.dart';

part 'listModel.g.dart';

@JsonSerializable()
class ListModel {
  List<Model> records;
  List<Model> record;
  ListModel({this.records, this.record});
  factory ListModel.fromJson(Map<String, dynamic> json) =>
      _$ListModelFromJson(json);
  Map<String, dynamic> toJson() => _$ListModelToJson(this);
}
