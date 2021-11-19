import 'package:json_annotation/json_annotation.dart';
import 'model.dart';

part 'listModel.g.dart';

@JsonSerializable()
class ListModel {
  List<Model> records;
  ListModel({this.records});
  factory ListModel.fromJson(Map<String, dynamic> json) =>
      _$ListModelFromJson(json);
  Map<String, dynamic> toJson() => _$ListModelToJson(this);
}
