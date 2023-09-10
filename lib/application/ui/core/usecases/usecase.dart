import 'package:dartz/dartz.dart';
import 'package:ecommerce_project/application/ui/core/error/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);

}