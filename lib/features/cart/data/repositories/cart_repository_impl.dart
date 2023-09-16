import 'package:dartz/dartz.dart';

import '../../../core/error/exception.dart';
import '../../../core/error/failure.dart';
import '../../domain/entities/basket_entity.dart';
import '../../domain/entities/cart_entity.dart';
import '../../domain/repositories/cart_repository.dart';
import '../datasources/cart_remote_data_source.dart';


class CartRepositoryImpl implements CartRepository {
  final CartRemoteDataSource cartRemoteDataSource;

  CartRepositoryImpl({required this.cartRemoteDataSource});

  @override
  Future<Either<Failure, List<CartEntity>>> getAllCarts() async{
    try {
      final remoteCart = await cartRemoteDataSource.getAllCarts();
      return Right(remoteCart);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<BasketEntity>>> getBasket() {
    throw UnimplementedError();
  }

}


