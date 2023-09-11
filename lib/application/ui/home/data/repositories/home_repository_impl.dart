import 'package:dartz/dartz.dart';
import 'package:ecommerce_project/application/ui/core/error/failure.dart';
import 'package:ecommerce_project/application/ui/home/data/datasources/home_remote_data_source.dart';
import 'package:ecommerce_project/application/ui/home/domain/entities/best_seller_entity.dart';
import 'package:ecommerce_project/application/ui/home/domain/entities/home_entiry.dart';
import 'package:ecommerce_project/application/ui/home/domain/entities/phone_entity.dart';
import 'package:ecommerce_project/application/ui/home/domain/repositories/home_repository.dart';

import '../../../core/error/exception.dart';
import '../../../core/platform/network_info.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource homeRemoteDataSource;
  final NetWorkInfo netWorkInfo;

  HomeRepositoryImpl(
      {required this.homeRemoteDataSource, required this.netWorkInfo});

  
    

  @override
  Future<Either<Failure, List<HomeEntity>>> getHomeStore() async {
    try {
      final remoteHome = await homeRemoteDataSource.getHomeStore();
      return Right(remoteHome);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
  
  @override
  Future<Either<Failure, List<BestSellerEntity>>> getBestSellers() {
    throw UnimplementedError();
  }
  
  @override
  Future<Either<Failure, List<PhoneEntity>>> getPhones() {
    throw UnimplementedError();
  }


}
