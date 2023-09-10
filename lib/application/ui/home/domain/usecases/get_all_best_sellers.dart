import 'package:dartz/dartz.dart';
import 'package:ecommerce_project/application/ui/core/usecases/usecase.dart';

import 'package:ecommerce_project/application/ui/home/domain/repositories/home_repository.dart';


import '../../../core/error/failure.dart';
import '../entities/best_seller_entity.dart';

class GetAllBestSellers extends UseCase<List<BestSellerEntity>, void>{
  final HomeRepository getAllBestSellerRepository;

  GetAllBestSellers(this.getAllBestSellerRepository);

  Future<Either<Failure, List<BestSellerEntity>>> call(void bestSellerParams) async{
    return await getAllBestSellerRepository.getBestSellers();
  }
}

