import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../core/error/exception.dart';
import '../models/home_store_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<HomeStoreModel>> getPhones();
  Future<List<HomeStoreModel>> getBestSeller();
  Future<List<HomeStoreModel>> getHomeStore();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final http.Client client;
  HomeRemoteDataSourceImpl({required this.client});

  @override
  Future<List<HomeStoreModel>> getPhones() => _getHomeFromUrl(
      'https://run.mocky.io/v3/654bd15e-b121-49ba-a588-960956b15175');

  @override
  Future<List<HomeStoreModel>> getBestSeller() => _getHomeFromUrl(
      'https://run.mocky.io/v3/654bd15e-b121-49ba-a588-960956b15175');

  @override
  Future<List<HomeStoreModel>> getHomeStore() => _getHomeFromUrl(
      'https://run.mocky.io/v3/654bd15e-b121-49ba-a588-960956b15175');

  Future<List<HomeStoreModel>> _getHomeFromUrl(String url) async {
    final urlHome = Uri.parse(url);
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


