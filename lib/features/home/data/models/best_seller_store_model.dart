import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/best_seller_entity.dart';
part 'best_seller_store_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class BestSellerModel extends BestSellerEntity {
  const BestSellerModel(
      {required super.id,
      required super.isFavorites,
      required super.title,
      required super.priceWithoutDiscount,
      required super.discountPrice,
      required super.picture});

  factory BestSellerModel.fromJson(Map<String, dynamic> json) =>
      _$BestSellerModelFromJson(json);

  Map<String, dynamic> toJson() => _$BestSellerModelToJson(this);
}
