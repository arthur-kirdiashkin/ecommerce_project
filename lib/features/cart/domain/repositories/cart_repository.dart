import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/basket_entity.dart';
import '../entities/cart_entity.dart';

abstract class CartRepository {
  Future<Either<Failure, List<CartEntity>>> getAllCarts();
  Future<Either<Failure, List<BasketEntity>>> getBasket();
}
