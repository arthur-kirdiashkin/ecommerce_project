import 'dart:convert';
import 'package:ecommerce_project/application/ui/core/error/exception.dart';
import 'package:ecommerce_project/application/ui/home/data/models/best_seller_store_model.dart';
import 'package:ecommerce_project/application/ui/home/data/models/home_store_model.dart';
import 'package:ecommerce_project/application/ui/home/data/models/phone_store_model.dart';
import 'package:http/http.dart' as http;

abstract class PhoneRemoteDataSource {
  Future<List<HomeStoreModel>> getPhones();
  Future<List<HomeStoreModel>> getBestSeller();
  Future<List<HomeStoreModel>> getHomeStore();
}

class PhoneRemoteDataSourceImpl implements PhoneRemoteDataSource {
  final http.Client client;
  PhoneRemoteDataSourceImpl({required this.client});

  @override
  Future<List<HomeStoreModel>> getPhones() => _getHomeFromUrl('https://run.mocky.io/v3/654bd15e-b121-49ba-a588-960956b15175');

  @override
  Future<List<HomeStoreModel>> getBestSeller() => _getHomeFromUrl('https://run.mocky.io/v3/654bd15e-b121-49ba-a588-960956b15175');

  @override
  Future<List<HomeStoreModel>> getHomeStore() => _getHomeFromUrl('https://run.mocky.io/v3/654bd15e-b121-49ba-a588-960956b15175');
   
  

  Future<List<HomeStoreModel>> _getHomeFromUrl(String url) async {
    final urlHome = Uri.parse(
        url);
    final response = await client.get(urlHome);
    if (response.statusCode == 200) {
      final homeJson = jsonDecode(response.body);
      List<HomeStoreModel> homeList = [];
      HomeStoreModel result = HomeStoreModel.fromJson(homeJson);
      homeList.add(result);
      return homeList;
    } else {
      throw ServerException();
    }
  }
}

// class ApiClient {
//   Future<List<PhoneModel>> getPhones() async {
//     final urlPhones = Uri.parse(
//         'https://run.mocky.io/v3/654bd15e-b121-49ba-a588-960956b15175');
//     final response = await http.get(urlPhones);
//     if (response.statusCode == 200) {
//       final phonesJson = jsonDecode(response.body);
//       // List<PhoneModel> list = [];
//       // PhoneModel res = PhoneModel.fromJson(phonesJson);
//       // list.add(res);
//       // return list;
//       final results = (phonesJson['home_store'] as List<dynamic>)
//           .map((phones) => PhoneModel.fromJson(phones))
//           .toList();
//       return results;
//     }
//     throw Exception();
//   }
// }

// class ApiClientBestSeller {
//   Future<List<BestSellerModel>> getBestSellers() async {
//     final urlPhones = Uri.parse(
//         'https://run.mocky.io/v3/654bd15e-b121-49ba-a588-960956b15175');
//     final response = await http.get(urlPhones);
//     if (response.statusCode == 200) {
//       final phonesJson = jsonDecode(response.body);
//       final resultsBestSeller = (phonesJson['best_seller'] as List<dynamic>)
//           .map((phones) => BestSellerModel.fromJson(phones))
//           .toList();
//       return resultsBestSeller;
//     }
//     throw Exception();
//   }
// }
