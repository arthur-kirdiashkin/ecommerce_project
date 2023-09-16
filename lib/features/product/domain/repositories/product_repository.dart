import 'package:dartz/dartz.dart';
import 'package:ecommerce_project/application/ui/home/data/datasources/home_remote_data_source.dart';
import 'package:ecommerce_project/application/ui/product/data/datasources/product_remote_data_source.dart';
import 'package:ecommerce_project/application/ui/product/data/models/product_store_model.dart';
import 'package:ecommerce_project/application/ui/product/domain/entities/product_entity.dart';

import '../../../core/error/failure.dart';
import '../../../home/domain/entities/home_entiry.dart';

// class OnePhoneRepository {
//   ApiClientProduct _apiClientProduct = ApiClientProduct();

//   Future<List<ProductEntity>> getPhone() => _apiClientProduct.getProduct();

// }

abstract class ProductRepository {
  Future<Either<Failure, List<ProductEntity>>> gellAllProducts();
}
