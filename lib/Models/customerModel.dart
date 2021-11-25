import 'package:json_annotation/json_annotation.dart';
import 'model.dart';

part 'customerModel.g.dart';

@JsonSerializable()
class CustomerModel {
  List<Model> records;
  CustomerModel({this.records});
  factory CustomerModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerModelFromJson(json);
  Map<String, dynamic> toJson() => _$CustomerModelToJson(this);
}
