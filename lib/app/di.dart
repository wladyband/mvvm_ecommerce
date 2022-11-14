import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:mvvm_ecommerce/data/data_source/remote_data_source.dart';
import 'package:mvvm_ecommerce/data/request/network/app_api.dart';
import 'package:mvvm_ecommerce/data/request/network/dio_factory.dart';
import 'package:mvvm_ecommerce/data/request/network/network_info.dart';
import 'package:mvvm_ecommerce/domain/respository/repository.dart';
import 'package:mvvm_ecommerce/domain/respository/repository_impl.dart';
import 'package:shared_preferences/shared_preferences.dart';


import 'app_prefs.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  final sharedPrefs = await SharedPreferences.getInstance();

  // shared prefs instance
  instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

  // app prefs instance
  instance
      .registerLazySingleton<AppPreferences>(() => AppPreferences(instance()));

  // network info
  instance.registerLazySingleton<NetworkInfo>(
          () => NetworkInfoImpl(DataConnectionChecker()));

  // dio factory
  instance.registerLazySingleton<DioFactory>(() => DioFactory(instance()));

  // app  service client
  final dio = await instance<DioFactory>().getDio();
  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));

  // remote data source
  instance.registerLazySingleton<RemoteDataSource>(
          () => RemoteDataSourceImplementer(instance()));

  // repository
  instance.registerLazySingleton<Repository>(
          () => RepositoryImpl(instance(), instance()));
}