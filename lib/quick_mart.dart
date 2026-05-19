import 'package:ecommerce_app/core/di/dependency_injection.dart';
import 'package:ecommerce_app/core/routing/app_router.dart';
import 'package:ecommerce_app/core/routing/route_names.dart';
import 'package:ecommerce_app/core/storage/shared_preferences_service.dart';
import 'package:ecommerce_app/core/storage/storage_keys.dart';
import 'package:ecommerce_app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class QuickMart extends StatelessWidget {
  final AppRouter appRouter;
  const QuickMart({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    final sharedPreferences = getIt<SharedPreferencesService>();
    final isFirstTime =
        sharedPreferences.getBool(key: StorageKeys.isFirstTime) ?? true;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: .light,
      initialRoute: isFirstTime
          ? RouteNames.onBoardingScreen
          : RouteNames.appAuthState,
    );
  }
}
