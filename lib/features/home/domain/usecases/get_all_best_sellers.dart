import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/best_seller_entity.dart';
import '../repositories/home_repository.dart';

class GetAllBestSellers extends UseCase<List<BestSellerEntity>, void> {
  final HomeRepository getAllBestSellerRepository;

  GetAllBestSellers(this.getAllBestSellerRepository);

  @override
  Future<Either<Failure, List<BestSellerEntity>>> call({void params}) async {
    return await getAllBestSellerRepository.getBestSellers();
  }
}
