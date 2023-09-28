

import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/basket_entity.dart';

part 'basket_model.g.dart';

@JsonSerializable()
class BasketModel extends BasketEntity {
  const BasketModel({
    required super.id,
    required super.images,
    required super.price,
    required super.title,
  });

  factory BasketModel.fromJson(Map<String, dynamic> json) =>
      _$BasketModelFromJson(json);

  Map<String, dynamic> toJson() => _$BasketModelToJson(this);
}
