import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/auth/repos/auth_repo.dart';
import 'package:ecommerce_app/core/network/api/api_service.dart';
import 'package:ecommerce_app/core/network/api/dio_factory.dart';
import 'package:ecommerce_app/core/network/connection/network_info.dart';
import 'package:ecommerce_app/core/storage/shared_preferences_service.dart';
import 'package:ecommerce_app/features/categories/data/repos/category_repo.dart';
import 'package:ecommerce_app/features/categories/logic/cubit/category_cubit.dart';
import 'package:ecommerce_app/features/forgot_password/data/repos/forgot_password_repo.dart';
import 'package:ecommerce_app/features/forgot_password/logic/forgot_password_cubit.dart';
import 'package:ecommerce_app/features/products/data/repos/product_repo.dart';
import 'package:ecommerce_app/features/login/data/repos/login_repo.dart';
import 'package:ecommerce_app/features/login/logic/login_cubit.dart';
import 'package:ecommerce_app/features/products/logic/cubit/category_products_cubit.dart';
import 'package:ecommerce_app/features/products/logic/cubit/latest_products_cubit.dart';
import 'package:ecommerce_app/features/products/logic/cubit/product_cubit.dart';
import 'package:ecommerce_app/features/register/data/repos/register_repo.dart';
import 'package:ecommerce_app/features/register/logic/register_cubit.dart';
import 'package:ecommerce_app/features/verify_email/data/repos/verify_email_repo.dart';
import 'package:ecommerce_app/features/verify_email/logic/verify_email_cubit.dart';
import 'package:ecommerce_app/features/wishlist/data/repos/wishlist_repo.dart';
import 'package:ecommerce_app/features/wishlist/logic/wishlist_cubit.dart';
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
  getIt.registerLazySingleton<VerifyEmailRepo>(() => VerifyEmailRepo(getIt()));
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerLazySingleton<ForgotPasswordRepo>(
    () => ForgotPasswordRepo(getIt()),
  );
  getIt.registerLazySingleton<ProductRepo>(() => ProductRepo(getIt(), getIt()));
  getIt.registerLazySingleton<CategoryRepo>(() => CategoryRepo(getIt()));
  getIt.registerLazySingleton<WishlistRepo>(() => WishlistRepo(getIt()));

  // Cubits
  getIt.registerFactory<RegisterCubit>(() => RegisterCubit(getIt(), getIt()));
  getIt.registerFactory<VerifyEmailCubit>(
    () => VerifyEmailCubit(getIt(), getIt()),
  );
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt(), getIt()));
  getIt.registerFactory<ForgotPasswordCubit>(
    () => ForgotPasswordCubit(getIt()),
  );
  getIt.registerFactory<ProductCubit>(() => ProductCubit(getIt()));
  getIt.registerFactory<CategoryCubit>(() => CategoryCubit(getIt()));
  getIt.registerFactory<LatestProductsCubit>(
    () => LatestProductsCubit(getIt()),
  );
  getIt.registerFactory<CategoryProductsCubit>(
    () => CategoryProductsCubit(getIt()),
  );

  getIt.registerLazySingleton<WishlistCubit>(() => WishlistCubit(getIt()));
}
