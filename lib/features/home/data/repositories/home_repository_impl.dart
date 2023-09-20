import 'package:dartz/dartz.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/error/failure.dart';
import '../../domain/entities/best_seller_entity.dart';
import '../../domain/entities/home_entiry.dart';
import '../../domain/entities/phone_entity.dart';
import '../../domain/repositories/home_repository.dart';
import '../datasources/home_remote_data_source.dart';


class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepositoryImpl({required this.homeRemoteDataSource});

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
