import 'package:dartz/dartz.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/error/failure.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/repositories/product_repository.dart';
import '../datasources/product_remote_data_source.dart';


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