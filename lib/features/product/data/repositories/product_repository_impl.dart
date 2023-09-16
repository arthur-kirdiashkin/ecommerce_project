import 'package:dartz/dartz.dart';
import 'package:ecommerce_project/application/ui/core/error/exception.dart';
import 'package:ecommerce_project/application/ui/core/error/failure.dart';
import 'package:ecommerce_project/application/ui/product/data/datasources/product_remote_data_source.dart';
import 'package:ecommerce_project/application/ui/product/domain/entities/product_entity.dart';
import 'package:ecommerce_project/application/ui/product/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository{
  final ProductRemoteDataSource productRemoteDataSource;

  ProductRepositoryImpl({required this.productRemoteDataSource});
  @override
  Future<Either<Failure, List<ProductEntity>>> gellAllProducts() async{
    try {
      final remoteProduct = await productRemoteDataSource.gellAllProducts();
      return Right(remoteProduct);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

}