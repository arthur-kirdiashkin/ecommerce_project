import 'package:dartz/dartz.dart';
import 'package:ecommerce_project/application/ui/core/error/failure.dart';
import 'package:ecommerce_project/application/ui/core/usecases/usecase.dart';
import 'package:ecommerce_project/application/ui/home/domain/entities/home_entiry.dart';
import 'package:ecommerce_project/application/ui/home/domain/repositories/home_repository.dart';

class GetAllHomeStore extends UseCase <List<HomeEntity>, void>{
  final HomeRepository homeRepository;

  GetAllHomeStore(this.homeRepository);

  @override
  Future<Either<Failure, List<HomeEntity>>> call(params) async{
    return await homeRepository.getHomeStore();
  }
}


