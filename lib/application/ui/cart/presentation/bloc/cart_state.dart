import 'package:ecommerce_project/application/ui/cart/domain/entities/basket_entity.dart';
import 'package:ecommerce_project/application/ui/cart/domain/entities/cart_entity.dart';
import 'package:equatable/equatable.dart';

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
 

  CartLoadedState({required this.cartProducts,});
}

class CartErrorState extends CartState {
  final String message;

  CartErrorState({required this.message});

}

