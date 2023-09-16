
import 'package:equatable/equatable.dart';

import '../../domain/entities/basket_entity.dart';
import '../../domain/entities/cart_entity.dart';

abstract class CartState extends Equatable {
CartState();

@override
  List<Object?> get props => [];
}

class CartInitialState extends CartState {

}

class CartLoadingState extends CartState {

}

class CartLoadedState extends CartState {
  final List<CartEntity> cartProducts;
  final List<BasketEntity> basket;
 

  CartLoadedState({required this.cartProducts, required this.basket});
}

class CartErrorState extends CartState {
  final String message;

  CartErrorState({required this.message});

}

