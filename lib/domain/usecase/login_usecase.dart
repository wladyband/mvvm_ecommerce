import 'package:dartz/dartz.dart';
import 'package:mvvm_ecommerce/app/functions.dart';
import 'package:mvvm_ecommerce/data/request/network/failure.dart';
import 'package:mvvm_ecommerce/data/request/request.dart';
import 'package:mvvm_ecommerce/domain/model/model.dart';
import 'package:mvvm_ecommerce/domain/respository/repository.dart';
import 'package:mvvm_ecommerce/domain/usecase/base_usecase.dart';

class LoginUseCase implements BaseUseCase<LoginUseCaseInput, Authentication> {
  Repository _repository;

  LoginUseCase(this._repository);

  @override
  Future<Either<Failure, Authentication>> execute(LoginUseCaseInput input) async {
    DeviceInfo deviceInfo = await getDeviceDetails();
    return await _repository
        .login(LoginRequest(input.email, input.password, deviceInfo.identifier, deviceInfo.name));
  }
}

class LoginUseCaseInput {
  String email;
  String password;

  LoginUseCaseInput(this.email, this.password);
}
