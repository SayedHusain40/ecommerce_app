import 'package:ecommerce_app/core/routing/route_names.dart';
import 'package:ecommerce_app/features/home/ui/home_screen.dart';
import 'package:ecommerce_app/features/login/ui/login_screen.dart';
import 'package:ecommerce_app/features/register/ui/screens/register_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  const AppRouter();

  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.homeScreen:
        return MaterialPageRoute(builder: (context) => HomeScreen());
      case RouteNames.loginScreen:
        return MaterialPageRoute(builder: (context) => LoginScreen());
      case RouteNames.registerScreen:
        return MaterialPageRoute(builder: (context) => RegisterScreen());
      default:
        return MaterialPageRoute(builder: (context) => UndefinedRouteScreen());
    }
  }
}

class UndefinedRouteScreen extends StatelessWidget {
  const UndefinedRouteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Something went wrong', style: TextStyle(fontSize: 18)),

            const SizedBox(height: 16),

            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.pushNamedAndRemoveUntil(
            //       context,
            //       RouteNames.homeScreen,
            //       (route) => false,
            //     );
            //   },
            //   child: const Text('Go Home'),
            // ),
          ],
        ),
      ),
    );
  }
}
