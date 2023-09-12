import 'package:dartz/dartz.dart';
import 'package:ecommerce_project/application/ui/core/error/failure.dart';
import 'package:ecommerce_project/application/ui/core/usecases/usecase.dart';
import 'package:ecommerce_project/application/ui/product/domain/entities/product_entity.dart';
import 'package:ecommerce_project/application/ui/product/domain/repositories/product_repository.dart';

class GetAllProducts extends UseCase<List<ProductEntity>, void> {
  final ProductRepository productRepository;

  GetAllProducts(this.productRepository);
  @override
  Future<Either<Failure, List<ProductEntity>>> call(void productParams) async{
    return await productRepository.gellAllProducts();
  }

}