import 'package:dartz/dartz.dart';
import 'package:mvvm_ecommerce/data/request/network/failure.dart';

abstract class BaseUseCase<In, Out> {
  Future<Either<Failure, Out>> execute(In input);
}