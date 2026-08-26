import 'package:ecommerce_app/core/config/firebase_config.dart';
import 'package:ecommerce_app/core/di/dependency_injection.dart';
import 'package:ecommerce_app/core/routing/app_router.dart';
import 'package:ecommerce_app/firebase_options_development.dart';
import 'package:ecommerce_app/quick_mart.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hive_ce_flutter/adapters.dart';

void main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await Hive.initFlutter();

  await setUpGetIt(DevelopmentFirebaseConfig());

  runApp(const QuickMart(appRouter: AppRouter()));
}
