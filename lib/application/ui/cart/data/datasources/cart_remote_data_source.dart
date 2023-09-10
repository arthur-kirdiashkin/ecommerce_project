import 'dart:convert';

import 'package:ecommerce_project/application/ui/cart/data/models/basket_model.dart';
import 'package:ecommerce_project/application/ui/cart/data/models/cart_model.dart';

import 'package:http/http.dart' as http;

class ApiClientCart {
  Future<List<CartModel>> getCart() async {
    final urlCart = Uri.parse(
        'https://run.mocky.io/v3/53539a72-3c5f-4f30-bbb1-6ca10d42c149');
    final response = await http.get(urlCart);
    if (response.statusCode == 200) {
      List<CartModel> cartModelList = [];
      final cartJson = json.decode(response.body);
      CartModel results = CartModel.fromJson(cartJson);
      cartModelList.add(results);
      return cartModelList;
      // return (cartJson as List<dynamic>)
      //     .map((e) => CartModel.fromJson(e))
      //     .toList();
    } else {
      throw Exception('Error getting Api Cart');
    }
  }
}
//   Future<List<BasketModel>> getBasket() async {
//     final urlBasket = Uri.parse(
//         'https://run.mocky.io/v3/53539a72-3c5f-4f30-bbb1-6ca10d42c149');
//     final response = await http.get(urlBasket);
//     if (response.hashCode == 200) {
//       // List<CartModel> cartModelList = [];
//       final basketJson = json.decode(response.body);
//       return (basketJson['basket'] as List<dynamic>)
//           .map((e) => BasketModel.fromJson(e))
//           .toList();
//     } else {
//       throw Exception('Error getting Api Basket');
//     }
//   }
// }
