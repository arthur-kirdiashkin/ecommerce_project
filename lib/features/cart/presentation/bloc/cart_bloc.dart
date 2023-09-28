import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/basket_entity.dart';
import '../../domain/entities/cart_entity.dart';
import '../../domain/usecases/get_all_carts.dart';
import 'cart_event.dart';
import 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final GetAllCarts getAllCarts;
  CartBloc({required this.getAllCarts}) : super(CartInitialState()) {
    on<CartEvent>(
      (event, emit) async {
        emit(CartLoadingState());

        List<CartEntity> _cartList = [];
        List<BasketEntity> _basketList = [];

        final _failureOrCart = await getAllCarts.call();
        _failureOrCart.fold(
          (failure) => const CartErrorState(message: 'Error'),
          (cart) => _cartList.addAll(cart),
        );
        _basketList = _cartList
            .map<List<BasketEntity>>((e) => e.basket!)
            .expand((element) => element)
            .toList();
        emit(CartLoadedState(cartProducts: _cartList, basket: _basketList));
      },
    );
  }
}
