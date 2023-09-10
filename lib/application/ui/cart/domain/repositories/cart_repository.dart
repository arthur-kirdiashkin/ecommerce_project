import 'package:ecommerce_project/application/ui/cart/data/datasources/cart_remote_data_source.dart';
import 'package:ecommerce_project/application/ui/cart/domain/entities/basket_entity.dart';
import 'package:ecommerce_project/application/ui/cart/domain/entities/cart_entity.dart';

class CartRepository {
  ApiClientCart _apiClientCart = ApiClientCart();

  Future<List<CartEntity>> getAllCarts() => _apiClientCart.getCart();

  // Future<List<BasketEntity>> getAllCartBasket() => _apiClientCart.getBasket();
  
}