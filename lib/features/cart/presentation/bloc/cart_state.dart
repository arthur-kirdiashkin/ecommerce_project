import 'package:equatable/equatable.dart';
import '../../domain/entities/basket_entity.dart';
import '../../domain/entities/cart_entity.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object?> get props => [];
}

class CartInitialState extends CartState {}

class CartLoadingState extends CartState {}

class CartLoadedState extends CartState {
  final List<CartEntity> cartProducts;
  final List<BasketEntity> basket;

  const CartLoadedState({required this.cartProducts, required this.basket});

  @override
  List<Object?> get props => [cartProducts, basket];
}

class CartErrorState extends CartState {
  final String message;

  const CartErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}
