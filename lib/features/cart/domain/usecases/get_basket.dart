import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/basket_entity.dart';
import '../repositories/cart_repository.dart';


class GetBasket extends UseCase<List<BasketEntity>, void> {
  final CartRepository basketRepository;

  GetBasket(this.basketRepository);
  
  @override
  Future<Either<Failure, List<BasketEntity>>> call({void params}) async{
    return await basketRepository.getBasket();
  }

}