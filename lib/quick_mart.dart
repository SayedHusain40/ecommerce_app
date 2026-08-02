import 'package:ecommerce_app/core/di/dependency_injection.dart';
import 'package:ecommerce_app/core/routing/app_router.dart';
import 'package:ecommerce_app/core/routing/route_names.dart';
import 'package:ecommerce_app/core/storage/shared_preferences_service.dart';
import 'package:ecommerce_app/core/storage/storage_keys.dart';
import 'package:ecommerce_app/core/theme/app_theme.dart';
import 'package:ecommerce_app/core/theme/logic/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuickMart extends StatelessWidget {
  final AppRouter appRouter;
  const QuickMart({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    final sharedPreferences = getIt<SharedPreferencesService>();
    final isFirstTime =
        sharedPreferences.getBool(key: StorageKeys.isFirstTime) ?? true;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark, // Android icons
        statusBarBrightness: Brightness.light, // iOS
      ),
      child: BlocProvider.value(
        value: getIt<ThemeCubit>(),
        child: BlocBuilder<ThemeCubit, ThemeMode>(
          builder: (context, themeMode) {
            final currentTheme = themeMode == ThemeMode.dark
                ? AppTheme.darkTheme
                : AppTheme.lightTheme;

            return MaterialApp(
              debugShowCheckedModeBanner: false,
              onGenerateRoute: appRouter.generateRoute,
              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
              themeMode: themeMode,
              initialRoute: false
                  ? RouteNames.onBoardingScreen
                  : RouteNames.appAuthState,
              builder: (context, child) {
                return AnimatedTheme(
                  data: currentTheme,
                  duration: const Duration(seconds: 1),
                  child: child!,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
