import 'package:dartz/dartz.dart';
import 'package:ecommerce_project/application/ui/cart/domain/entities/basket_entity.dart';
import 'package:ecommerce_project/application/ui/cart/domain/entities/cart_entity.dart';
import '../../../core/error/failure.dart';

// class CartRepository {
//   ApiClientCart _apiClientCart = ApiClientCart();

//   Future<List<CartEntity>> getAllCarts() => _apiClientCart.getCart();

//   // Future<List<BasketEntity>> getAllCartBasket() => _apiClientCart.getBasket();

// }

abstract class CartRepository {
  Future<Either<Failure, List<CartEntity>>> getAllCarts();
  Future<Either<Failure, List<BasketEntity>>> getBasket();
}
