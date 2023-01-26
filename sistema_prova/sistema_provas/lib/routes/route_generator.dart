
import 'package:flutter/material.dart';
import 'package:sistema_provas/screens/home/home_scren.dart';
import 'package:sistema_provas/screens/login/login_screen.dart';
import 'package:sistema_provas/screens/singup/singup_screen.dart';
import 'package:sistema_provas/screens/splash_screen.dart';


class RouteGenerator {
  // ignore: missing_return
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // ignore: unused_local_variable
    final args = settings.arguments;

    switch (settings.name) {
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case '/signup':
        return MaterialPageRoute(builder: (_) => const SignUpScreen());

      case '/homeScreen':
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      
      case '/':
      default:
        return MaterialPageRoute(builder: (_) => const SplashScreen(),
        );
    }
  }
}
