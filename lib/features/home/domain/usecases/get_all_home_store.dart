import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecases/usecase.dart';
import '../entities/home_entiry.dart';
import '../repositories/home_repository.dart';


class GetAllHomeStore extends UseCase <List<HomeEntity>, void>{
  final HomeRepository homeRepository;

  GetAllHomeStore(this.homeRepository);

  @override
  Future<Either<Failure, List<HomeEntity>>> call({void params}) async{
    return await homeRepository.getHomeStore();
  }
}


