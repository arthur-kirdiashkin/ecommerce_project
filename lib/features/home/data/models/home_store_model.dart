import 'package:ecommerce_project/features/home/data/models/phone_store_model.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/home_entiry.dart';
import 'best_seller_store_model.dart';
part 'home_store_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class HomeStoreModel extends HomeEntity {
  const HomeStoreModel({
    required super.bestSeller,
    required super.homeStore,
  });

  factory HomeStoreModel.fromJson(Map<String, dynamic> json) =>
      _$HomeStoreModelFromJson(json);

  Map<String, dynamic> toJson() => _$HomeStoreModelToJson(this);
}
