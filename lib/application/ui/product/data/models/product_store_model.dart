import 'package:ecommerce_project/application/ui/product/domain/entities/product_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'product_store_model.g.dart';
@JsonSerializable()
class ProductModel extends ProductEntity {
  @JsonKey(name: 'CPU')
  ProductModel(
      {required super.cpu,
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
  // factory ProductModel.fromJson(Map<String, dynamic> json) {
  //   return ProductModel(
  //     cpu: json['CPU'],
  //     camera: json['camera'],
  //     capacity: json['capacity'] as List<String>,
  //     color: json['color'] as List<String>,
  //     id: json['id'] as String,
  //     images: json['images'] as List<String>,
  //     isFavorites: json['isFavorites'] as bool,
  //     price: json['price'] as int,
  //     rating: json['rating'] as double,
  //     sd: json['sd'] as String,
  //     ssd: json['ssd'] as String,
  //     title: json['title'] as String,
  //   );
  // }
  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
  // Map<String, dynamic> toJson() {
  //   return {
  //     'CPU': cpu,
  //     'camera': camera,
  //     'capacity': capacity,
  //     'color': color,
  //     'id': id,
  //     'images': images,
  //     'isFavorites': isFavorites,
  //     'price': price,
  //     'rating': rating,
  //     'sd': sd,
  //     'ssd': ssd,
  //     'title': title,

  //   };
  // }

}
