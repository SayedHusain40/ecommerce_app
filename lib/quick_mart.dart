import 'package:ecommerce_app/core/di/dependency_injection.dart';
import 'package:ecommerce_app/core/localization/logic/locale_cubit.dart';
import 'package:ecommerce_app/core/routing/app_router.dart';
import 'package:ecommerce_app/core/routing/route_names.dart';
import 'package:ecommerce_app/core/storage/shared_preferences_service.dart';
import 'package:ecommerce_app/core/storage/storage_keys.dart';
import 'package:ecommerce_app/core/theme/app_theme.dart';
import 'package:ecommerce_app/core/theme/logic/theme_cubit.dart';
import 'package:ecommerce_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:toastification/toastification.dart';

class QuickMart extends StatelessWidget {
  final AppRouter appRouter;
  const QuickMart({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    final sharedPreferences = getIt<SharedPreferencesService>();
    final isFirstTime =
        sharedPreferences.getBool(key: StorageKeys.isFirstTime) ?? true;

    return ToastificationWrapper(
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark, // Android icons
          statusBarBrightness: Brightness.light, // iOS
        ),
        child: MultiBlocProvider(
          providers: [
            BlocProvider.value(value: getIt<ThemeCubit>()),
            BlocProvider.value(value: getIt<LocaleCubit>()),
          ],
          child: BlocBuilder<ThemeCubit, ThemeMode>(
            builder: (context, themeMode) {
              return BlocBuilder<LocaleCubit, Locale>(
                builder: (context, locale) {
                  return MaterialApp(
                    debugShowCheckedModeBanner: false,
                    onGenerateRoute: appRouter.generateRoute,
                    theme: AppTheme.lightTheme,
                    darkTheme: AppTheme.darkTheme,
                    themeMode: themeMode,
                    locale: locale,
                    supportedLocales: AppLocalizations.supportedLocales,
                    localizationsDelegates: const [
                      AppLocalizations.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                    ],
                    initialRoute: isFirstTime
                        ? RouteNames.onBoardingScreen
                        : RouteNames.appAuthState,
                    builder: (context, child) {
                      return MediaQuery(
                        data: MediaQuery.of(context).copyWith(
                          textScaler: MediaQuery.textScalerOf(
                            context,
                          ).clamp(maxScaleFactor: 1.3),
                        ),
                        child: AnimatedTheme(
                          data: themeMode == ThemeMode.dark
                              ? AppTheme.darkTheme
                              : AppTheme.lightTheme,
                          duration: const Duration(milliseconds: 300),
                          child: child!,
                        ),
                      );
                    },
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
