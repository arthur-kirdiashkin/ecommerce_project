import 'dart:convert';

import 'package:ecommerce_project/application/ui/cart/data/models/basket_model.dart';
import 'package:ecommerce_project/application/ui/cart/data/models/cart_model.dart';
import 'package:ecommerce_project/application/ui/core/error/exception.dart';

import 'package:http/http.dart' as http;

// class ApiClientCart {
//   Future<List<CartModel>> getCart() async {
//     final urlCart = Uri.parse(
//         'https://run.mocky.io/v3/53539a72-3c5f-4f30-bbb1-6ca10d42c149');
//     final response = await http.get(urlCart);
//     if (response.statusCode == 200) {
//       List<CartModel> cartModelList = [];
//       final cartJson = json.decode(response.body);
//       CartModel results = CartModel.fromJson(cartJson);
//       cartModelList.add(results);
//       return cartModelList;
//     } else {
//       throw Exception('Error getting Api Cart');
//     }
//   }
// }

abstract class CartRemoteDataSource {
  Future<List<CartModel>> getAllCarts();
  Future<List<CartModel>> getBasket();
}

class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  final http.Client client;

  CartRemoteDataSourceImpl({required this.client});
  @override
  Future<List<CartModel>> getAllCarts() => _getCartsFromUrl(
      'https://run.mocky.io/v3/53539a72-3c5f-4f30-bbb1-6ca10d42c149');

  @override
  Future<List<CartModel>> getBasket() => _getCartsFromUrl(
      'https://run.mocky.io/v3/53539a72-3c5f-4f30-bbb1-6ca10d42c149');

  Future<List<CartModel>> _getCartsFromUrl(String url) async {
    final urlCart = Uri.parse(url);
    final response = await client.get(urlCart);
    if (response.statusCode == 200) {
      List<CartModel> cartList = [];
      final cartJson = jsonDecode(response.body);
      final results = CartModel.fromJson(cartJson);
      cartList.add(results);
      return cartList;
    } else {
      throw ServerException();
    }
  }
}
