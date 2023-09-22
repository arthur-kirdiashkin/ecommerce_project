import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/product_entity.dart';
import '../repositories/product_repository.dart';


class GetAllProducts extends UseCase<List<ProductEntity>, void> {
  final ProductRepository productRepository;

  GetAllProducts(this.productRepository);
  @override
  Future<Either<Failure, List<ProductEntity>>> call({void params}) async{
    return await productRepository.gellAllProducts();
  }

}