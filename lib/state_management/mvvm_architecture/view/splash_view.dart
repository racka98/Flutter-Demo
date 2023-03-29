import 'package:flutter/material.dart';
import 'package:flutter_demo/state_management/mvvm_architecture/view_model/services/splash_services.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final splashServices = SplashServices();

  @override
  void initState() {
    super.initState();
    splashServices.checkAuthentication(
        ({required route}) => Navigator.pushNamed(context, route));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Splash Screen",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
    );
  }
}
