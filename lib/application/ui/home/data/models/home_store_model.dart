import 'package:ecommerce_project/application/ui/home/data/models/phone_store_model.dart';
import 'package:ecommerce_project/application/ui/home/domain/entities/home_entiry.dart';
import 'package:json_annotation/json_annotation.dart';

import 'best_seller_store_model.dart';


part 'home_store_model.g.dart';
@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class HomeStoreModel extends HomeEntity {
  HomeStoreModel({
    required super.bestSeller,
    required super.homeStore,
  });


  // factory HomeStoreModel.fromJson(Map <String, dynamic> json) => _$HomeStoreModelFromJson(json);

  // Map<String, dynamic> toJson() => _$HomeStoreModelToJson(this);
}
