import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../entities/best_seller_entity.dart';
import '../entities/home_entiry.dart';
import '../entities/phone_entity.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<HomeEntity>>> getHomeStore();
  Future<Either<Failure, List<PhoneEntity>>> getPhones();
  Future<Either<Failure, List<BestSellerEntity>>> getBestSellers();
}
