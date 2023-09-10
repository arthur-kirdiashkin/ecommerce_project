import 'package:ecommerce_project/application/ui/cart/domain/entities/basket_entity.dart';
import 'package:equatable/equatable.dart';

import '../../data/models/basket_model.dart';

class CartEntity extends Equatable {
  final List<BasketModel> basket;
  final String delivery;
  final String id;
  final int total;

  CartEntity({
    required this.basket,
    required this.delivery,
    required this.id,
    required this.total,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [basket, delivery, id, total];
}
