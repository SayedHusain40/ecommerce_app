import 'package:ecommerce_app/core/di/dependency_injection.dart';
import 'package:ecommerce_app/core/routing/app_router.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setUpGetIt();

  runApp(MyApp(appRouter: AppRouter()));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  const MyApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,
      home: Scaffold(body: Center(child: Text('Hello'))),
    );
  }
}
