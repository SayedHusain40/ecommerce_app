import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/auth/repos/auth_repo.dart';
import 'package:ecommerce_app/core/network/api/api_service.dart';
import 'package:ecommerce_app/core/network/api/dio_factory.dart';
import 'package:ecommerce_app/core/network/connection/network_info.dart';
import 'package:ecommerce_app/core/storage/shared_preferences_service.dart';
import 'package:ecommerce_app/features/register/data/repos/register_repo.dart';
import 'package:ecommerce_app/features/register/logic/register_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> setUpGetIt() async {
  // Shared Preferences (non-sensitive data)
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  getIt.registerLazySingleton<SharedPreferencesService>(
    () => SharedPreferencesService(getIt()),
  );

  // Connectivity Checker
  getIt.registerLazySingleton<DataConnectionChecker>(
    () => DataConnectionChecker(),
  );
  // Network Info
  getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(getIt()));

  // DioFactory
  getIt.registerLazySingleton<Dio>(() => DioFactory.createDio());

  // ApiService
  getIt.registerLazySingleton<ApiService>(() => ApiService(getIt()));

  // Firebase
  final firebaseAuth = FirebaseAuth.instance;
  getIt.registerLazySingleton<FirebaseAuth>(() => firebaseAuth);

  // googleSignIn
  final googleSignIn = GoogleSignIn.instance;
  await googleSignIn.initialize(
    serverClientId:
        '613394897708-qib5j3c8h1279vfp4sk8ip6s9gd2qg7e.apps.googleusercontent.com',
  );
  getIt.registerLazySingleton<GoogleSignIn>(() => googleSignIn);

  // Repositories
  getIt.registerLazySingleton<RegisterRepo>(() => RegisterRepo(getIt()));
  getIt.registerLazySingleton<AuthRepo>(() => AuthRepo(getIt(), getIt()));

  // Cubits
  getIt.registerLazySingleton<RegisterCubit>(
    () => RegisterCubit(getIt(), getIt()),
  );
}
