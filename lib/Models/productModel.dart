// import 'package:json_annotation/json_annotation.dart';

// part 'productModel.g.dart';

// @JsonSerializable()
// class ProductModel {
//   String id;
//   int width;
//   int height;
//   String url;
//   ProductModel({this.id, this.url, this.height,this.width});
//   factory ProductModel.fromJson(Map<String, dynamic> json) =>
//       _$ProductModelFromJson(json);
//   Map<String, dynamic> toJson() => _$ProductModelToJson(this);
// }

import 'package:grocestore/customer.dart';
import 'package:json_annotation/json_annotation.dart';
import 'model.dart';

part 'productModel.g.dart';

@JsonSerializable()
class ProductModel {
  List<Model> product_image;
  ProductModel({this.product_image});
  factory ProductModel.fromJson(var json) =>
      _$ProductModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}

