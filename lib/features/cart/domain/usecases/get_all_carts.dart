

import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecases/usecase.dart';
import '../entities/cart_entity.dart';
import '../repositories/cart_repository.dart';


class GetAllCarts extends UseCase<List<CartEntity>, void> {
  final CartRepository cartRepository;

  GetAllCarts(this.cartRepository);
  @override
  Future<Either<Failure, List<CartEntity>>> call({void params}) async{
    return await cartRepository.getAllCarts();
  }

}

