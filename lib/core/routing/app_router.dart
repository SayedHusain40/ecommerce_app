import 'package:flutter/material.dart';

class AppRouter {
  const AppRouter();

  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
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
