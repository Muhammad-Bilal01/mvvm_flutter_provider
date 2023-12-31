import 'package:flutter/material.dart';
import 'package:mvvm_flutter_provider/utils/routes/routes_name.dart';
import 'package:mvvm_flutter_provider/views/home_screen.dart';
import 'package:mvvm_flutter_provider/views/login_screen.dart';
import 'package:mvvm_flutter_provider/views/signup_view.dart';
import 'package:mvvm_flutter_provider/views/splash_screen.dart';

class Routes {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splashScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SplashScreen());

      case RoutesName.loginScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const LoginScreen());

      case RoutesName.signupScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SignupView());

      case RoutesName.homeSccreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomeScreen());
      default:
        // if define route is not access
        return MaterialPageRoute(
          builder: (BuildContext context) {
            return const Scaffold(
              body: Center(
                child: Text("No routes Found"),
              ),
            );
          },
        );
    }
  }
}
