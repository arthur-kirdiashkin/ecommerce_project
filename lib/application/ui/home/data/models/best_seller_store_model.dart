import 'package:ecommerce_project/application/ui/home/domain/entities/best_seller_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'best_seller_store_model.g.dart';
@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class BestSellerModel extends BestSellerEntity {
  BestSellerModel(
      {required super.id,
      required super.isFavorites,
      required super.title,
      required super.priceWithoutDiscount,
      required super.discountPrice,
      required super.picture});


  factory BestSellerModel.fromJson(Map<String, dynamic> json) => _$BestSellerModelFromJson(json);

  Map<String, dynamic> toJson() => _$BestSellerModelToJson(this);
  // factory BestSellerModel.fromJson(Map<String, dynamic> json) {
  //   return BestSellerModel(
  //     id: json['id'],
  //     isFavorites: json['is_favorites'],
  //     title: json['title'],
  //     priceWithoutDiscount: json['price_without_discount'],
  //     discountPrice: json['discount_price'],
  //     picture: json['picture'],
  //   );
  // }
}
