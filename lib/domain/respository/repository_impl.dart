import 'package:dartz/dartz.dart';
import 'package:mvvm_ecommerce/data/data_source/remote_data_source.dart';
import 'package:mvvm_ecommerce/data/mapper/mapper.dart';
import 'package:mvvm_ecommerce/data/request/network/failure.dart';
import 'package:mvvm_ecommerce/data/request/network/network_info.dart';
import 'package:mvvm_ecommerce/data/request/request.dart';
import 'package:mvvm_ecommerce/domain/model/model.dart';
import 'package:mvvm_ecommerce/domain/respository/repository.dart';


class RepositoryImpl extends Repository {
  RemoteDataSource _remoteDataSource;
  NetworkInfo _networkInfo;

  RepositoryImpl(this._remoteDataSource, this._networkInfo);

  @override
  Future<Either<Failure, Authentication>> login(
      LoginRequest loginRequest) async {
    if (await _networkInfo.isConnected) {
      // its safe to call the API
      final response = await _remoteDataSource.login(loginRequest);

      if (response.status == 0) // success
          {
        // return data (success)
        // return right
        return Right(response.toDomain());
      } else {
        // return biz logic error
        // return left
        return Left(Failure(
            409, response.message ?? "we have biz error logic from API side"));
      }
    } else {
      // return connection error
      return Left(Failure(501, "please check your internet connection"));
    }
  }

  @override
  Future<Either<Failure, String>> forgotPassword(String email) {
    // TODO: implement forgotPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, HomeObject>> getHome() {
    // TODO: implement getHome
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, StoreDetails>> getStoreDetails() {
    // TODO: implement getStoreDetails
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Authentication>> register(RegisterRequest registerRequest) {
    // TODO: implement register
    throw UnimplementedError();
  }
}