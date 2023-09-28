
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/cart_entity.dart';
import 'basket_model.dart';

part 'cart_model.g.dart';

@JsonSerializable()


class CartModel extends CartEntity {
  const CartModel({
    required super.basket,
    required super.delivery,
    required super.id,
    required super.total,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) => _$CartModelFromJson(json);

  Map<String, dynamic> toJson() => _$CartModelToJson(this);
}
