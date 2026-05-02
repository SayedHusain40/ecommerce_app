import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/network/api/api_service.dart';
import 'package:ecommerce_app/core/network/api/dio_factory.dart';
import 'package:ecommerce_app/core/network/connection/network_info.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setUpGetIt() async {

  // Connectivity Checker && Network Info
  getIt.registerLazySingleton<DataConnectionChecker>(
    () => DataConnectionChecker(),
  );
  getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(getIt()));

  // DioFactory
  getIt.registerLazySingleton<Dio>(() => DioFactory.createDio());

  // ApiService
  getIt.registerLazySingleton<ApiService>(() => ApiService(getIt()));

  // LocalDataSources

  // Repositories

  // UseCases

  // Cubits
}
