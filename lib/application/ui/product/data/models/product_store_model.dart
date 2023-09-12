import 'package:ecommerce_project/application/ui/product/domain/entities/product_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'product_store_model.g.dart';
@JsonSerializable()
class ProductModel extends ProductEntity {
  @JsonKey(name: 'CPU')
  final String? cpu;
  ProductModel(
      {this.cpu,
      required super.camera,
      required super.capacity,
      required super.color,
      required super.id,
      required super.images,
      required super.isFavorites,
      required super.price,
      required super.rating,
      required super.sd,
      required super.ssd,
      required super.title});

  factory ProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
 

}
