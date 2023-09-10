import 'package:ecommerce_project/application/ui/home/data/datasources/phone_remote_data_source.dart';
import 'package:ecommerce_project/application/ui/product/data/datasources/product_remote_data_source.dart';
import 'package:ecommerce_project/application/ui/product/domain/entities/product_entity.dart';

class OnePhoneRepository {
  ApiClientProduct _apiClientProduct = ApiClientProduct();

  Future<List<ProductEntity>> getPhone() => _apiClientProduct.getProduct();

  
}