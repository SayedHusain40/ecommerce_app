import 'package:ecommerce_app/core/di/dependency_injection.dart';
import 'package:ecommerce_app/core/routing/app_router.dart';
import 'package:ecommerce_app/quick_mart.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setUpGetIt();

  runApp(QuickMart(appRouter: AppRouter()));
}
