import 'package:dartz/dartz.dart';
import '../../../core/error/failure.dart';
import '../../../core/usecases/usecase.dart';
import '../entities/phone_entity.dart';
import '../repositories/home_repository.dart';

class GetAllPhones extends UseCase<List<PhoneEntity>, void> {
  final HomeRepository phoneRepository;

  GetAllPhones(this.phoneRepository);

  Future<Either<Failure, List<PhoneEntity>>> call({void params}) async {
    return await phoneRepository.getPhones();
  }
}
