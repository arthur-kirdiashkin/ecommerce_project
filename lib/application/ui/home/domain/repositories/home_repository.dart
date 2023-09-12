import 'package:dartz/dartz.dart';
import 'package:ecommerce_project/application/ui/home/data/datasources/home_remote_data_source.dart';
import 'package:ecommerce_project/application/ui/home/domain/entities/best_seller_entity.dart';
import 'package:ecommerce_project/application/ui/home/domain/entities/home_entiry.dart';
import 'package:ecommerce_project/application/ui/home/domain/entities/phone_entity.dart';

import '../../../core/error/failure.dart';

abstract class HomeRepository {
  Future <Either<Failure, List<HomeEntity>>> getHomeStore();
  Future <Either<Failure, List<PhoneEntity>>> getPhones();
  Future <Either<Failure, List<BestSellerEntity>>> getBestSellers();
}




//  class PhoneRepository {
//   ApiClient _apiClient = ApiClient();
//   ApiClientBestSeller _apiClientBestSeller = ApiClientBestSeller();

//    Future <List<PhoneEntity>> getPhones() => _apiClient.getPhones();

//    Future <List<BestSellerEntity>> getBestSellers() => _apiClientBestSeller.getBestSellers();
// }