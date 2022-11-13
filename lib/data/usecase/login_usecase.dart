import 'package:dartz/dartz.dart';
import 'package:mvvm_ecommerce/data/request/network/failure.dart';
import 'package:mvvm_ecommerce/data/request/request.dart';
import 'package:mvvm_ecommerce/data/usecase/base_usecase.dart';
import 'package:mvvm_ecommerce/domain/model/model.dart';
import 'package:mvvm_ecommerce/domain/respository/repository.dart';

class LoginUseCase implements BaseUseCase<LoginUseCaseInput, Authentication> {
  Repository _repository;

  LoginUseCase(this._repository);

  @override
  Future<Either<Failure, Authentication>> execute(
      LoginUseCaseInput input) async {
    await _repository
        .login(LoginRequest(input.email, input.password, "imei", "deviceType"));
  }
}

class LoginUseCaseInput {
  String email;
  String password;

  LoginUseCaseInput(this.email, this.password);
}