import 'dart:convert';

import 'package:ecommerce_project/application/ui/product/data/models/product_store_model.dart';
import 'package:http/http.dart' as http;

class ApiClientProduct {
  Future<List<ProductModel>> getProduct() async {
    final urlProduct = Uri.parse(
        'https://run.mocky.io/v3/6c14c560-15c6-4248-b9d2-b4508df7d4f5');
    final response = await http.get(urlProduct);
    if (response.statusCode == 200) {
      final productJson = jsonDecode(response.body);
      List<ProductModel> list = [];
      ProductModel results = ProductModel.fromJson(productJson);
      list.add(results);
      return list;
      
    }
    throw Exception();
  }
}


