import 'package:flutter/material.dart';
import 'package:flutter_demo/state_management/mvvm_architecture/utils/routes/routes_name.dart';
import 'package:flutter_demo/state_management/mvvm_architecture/view/home_screen.dart';
import 'package:flutter_demo/state_management/mvvm_architecture/view/login_view.dart';
import 'package:flutter_demo/state_management/mvvm_architecture/view/sign_up_view.dart';
import 'package:flutter_demo/state_management/mvvm_architecture/view/splash_view.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splash:
        return MaterialPageRoute(builder: (context) => const SplashView());
      case RoutesName.login:
        return MaterialPageRoute(builder: (context) => const LoginView());
      case RoutesName.signUp:
        return MaterialPageRoute(builder: (context) => const SignUpView());
      case RoutesName.home:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(child: Text("No Route Defined")),
          ),
        );
    }
  }
}
