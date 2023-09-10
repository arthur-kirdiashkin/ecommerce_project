import 'package:dartz/dartz.dart';
import 'package:ecommerce_project/application/ui/core/usecases/usecase.dart';
import 'package:ecommerce_project/application/ui/home/domain/repositories/home_repository.dart';


import '../../../core/error/failure.dart';
import '../entities/phone_entity.dart';

class GetAllPhones extends UseCase<List<PhoneEntity>, void>{
  final HomeRepository phoneRepository;

  GetAllPhones(this.phoneRepository);

  Future<Either<Failure, List<PhoneEntity>>> call(void phoneParams) async {
    return await phoneRepository.getPhones();
  }
  
 
}


