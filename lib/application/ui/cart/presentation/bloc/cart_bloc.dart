import 'package:ecommerce_project/application/ui/cart/domain/entities/basket_entity.dart';
import 'package:ecommerce_project/application/ui/cart/domain/entities/cart_entity.dart';
import 'package:ecommerce_project/application/ui/cart/domain/repositories/cart_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cart_event.dart';
import 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRepository _cartRepository;
  CartBloc(this._cartRepository) : super(CartInitialState()) {
    on<CartEvent>((event, emit) async {
      emit(CartLoadingState());
      try {
        var carts = <CartEntity>[];
        var basketCarts = <BasketEntity>[];
        final _cartProduct = await _cartRepository.getAllCarts();
        // final _basketProduct = await _cartRepository.getAllCartBasket();
        carts.addAll(_cartProduct);
        // basketCarts.addAll(_basketProduct);
        emit(CartLoadedState(cartProducts: _cartProduct));
      } catch (e) {
        emit(CartErrorState(message: 'Error Cart Bloc'));
      }
    });
  }
}
