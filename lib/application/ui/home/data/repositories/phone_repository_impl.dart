import 'package:dartz/dartz.dart';
import 'package:ecommerce_project/application/ui/core/error/failure.dart';
import 'package:ecommerce_project/application/ui/home/data/datasources/phone_remote_data_source.dart';
import 'package:ecommerce_project/application/ui/home/domain/entities/best_seller_entity.dart';
import 'package:ecommerce_project/application/ui/home/domain/entities/phone_entity.dart';
import 'package:ecommerce_project/application/ui/home/domain/repositories/home_repository.dart';

import '../../../core/platform/network_info.dart';

// class PhoneRepositoryImpl implements PhoneRepository {
//   final PhoneRemoteDataSource phoneRemoteDataSource;
//   final NetWorkInfo netWorkInfo;

//   PhoneRepositoryImpl({
//     required this.phoneRemoteDataSource,
//     required this.netWorkInfo,
//   });

//   @override
//   Future<Either<Failure, List<BestSellerEntity>>> getBestSeller() async {
//     if (await netWorkInfo.isConnected) {
//         final remoteBestSellers = await phoneRemoteDataSource.getBestSeller();
//         return Right(remoteBestSellers);
//     } else {
//       return Left(ServerFailure());

//     }
//   }

//   @override
//   Future<Either<Failure, List<PhoneEntity>>> getPhones() async {
//     if (await netWorkInfo.isConnected) {
      
//         final remotePhones = await phoneRemoteDataSource.getPhones();
//         return Right(remotePhones);
//     } else {
//       return Left(ServerFailure());
//     }
//   }
// }
