import 'package:ecommerce_app/core/di/dependency_injection.dart';
import 'package:ecommerce_app/core/routing/app_router.dart';
import 'package:ecommerce_app/core/routing/route_names.dart';
import 'package:ecommerce_app/core/storage/shared_preferences_service.dart';
import 'package:ecommerce_app/core/storage/storage_keys.dart';
import 'package:ecommerce_app/core/theme/app_theme.dart';
import 'package:ecommerce_app/features/categories/logic/cubit/category_cubit.dart';
import 'package:ecommerce_app/features/products/logic/cubit/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuickMart extends StatelessWidget {
  final AppRouter appRouter;
  const QuickMart({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    final sharedPreferences = getIt<SharedPreferencesService>();
    final isFirstTime =
        sharedPreferences.getBool(key: StorageKeys.isFirstTime) ?? true;

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<CategoryCubit>()),
        BlocProvider(create: (_) => getIt<ProductCubit>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: appRouter.generateRoute,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.light,
        initialRoute: isFirstTime
            ? RouteNames.onBoardingScreen
            : RouteNames.appAuthState,
      ),
    );
  }
}
