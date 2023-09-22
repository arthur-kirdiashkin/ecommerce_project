import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../../core/error/exception.dart';
import '../models/product_store_model.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> gellAllProducts();
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final http.Client client;

  ProductRemoteDataSourceImpl({required this.client});
  @override
  Future<List<ProductModel>> gellAllProducts() async {
    final urlProduct = Uri.parse(
        'https://run.mocky.io/v3/6c14c560-15c6-4248-b9d2-b4508df7d4f5');
    final repsonse = await client.get(urlProduct);
    if (repsonse.statusCode == 200) {
      final productJson = jsonDecode(repsonse.body);
      List<ProductModel> productList = [];
      ProductModel results = ProductModel.fromJson(productJson);
      productList.add(results);
      return productList;
    } else {
      throw ServerException();
    }
  }
}
