

import 'package:mvvm_ecommerce/data/request/network/app_api.dart';
import 'package:mvvm_ecommerce/data/request/request.dart';
import 'package:mvvm_ecommerce/data/responses/responses.dart';

abstract class RemoteDataSource {
  Future<AuthenticationResponse> login(LoginRequest loginRequest);

  Future<AuthenticationResponse> register(RegisterRequest registerRequest);

  // Future<ForgotPasswordResponse> forgotPassword(String email);
  //
  // Future<HomeResponse> getHome();
  //
  // Future<StoreDetailsResponse> getStoreDetails();
}

class RemoteDataSourceImplementer  {
  AppServiceClient _appServiceClient;

  RemoteDataSourceImplementer(this._appServiceClient);

  @override
  Future<AuthenticationResponse> login(LoginRequest loginRequest) async {
    return await _appServiceClient.login(
        loginRequest.email, loginRequest.password, "", "");
  }

  // @override
  // Future<ForgotPasswordResponse> forgotPassword(String email) async {
  //   return await _appServiceClient.forgotPassword(email);
  // }
  //
  // @override
  // Future<AuthenticationResponse> register(RegisterRequest registerRequest) async {
  //   return await _appServiceClient.register(
  //       registerRequest.countryMobileCode,
  //       registerRequest.userName,
  //       registerRequest.email,
  //       registerRequest.password,
  //       registerRequest.mobileNumber,
  //       "");
  // }
  //
  // @override
  // Future<HomeResponse> getHome() async {
  //   return await _appServiceClient.getHome();
  // }
  //
  // @override
  // Future<StoreDetailsResponse> getStoreDetails() async {
  //   return await _appServiceClient.getStoreDetails();
  // }
}
