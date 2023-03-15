import 'package:flutter/material.dart';
import 'package:flutter_demo/state_management/provider_architecture/core/models/user.dart';
import 'package:flutter_demo/state_management/provider_architecture/core/services/authentication_service.dart';
import 'package:flutter_demo/state_management/provider_architecture/locator.dart';
import 'package:flutter_demo/state_management/provider_architecture/ui/router.dart'
    as router;
import 'package:provider/provider.dart';

Widget providerApp() {
  setupLocator();
  return const ProviderArchApp();
}

class ProviderArchApp extends StatelessWidget {
  const ProviderArchApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>(
      initialData: User.initial(),
      create: (context) =>
          locator<AuthenticationService>().userController.stream,
      child: MaterialApp(
        title: "Provider Architecture",
        theme: ThemeData(primarySwatch: Colors.cyan),
        initialRoute: "/login",
        onGenerateRoute: router.Router.generateRoute,
      ),
    );
  }
}
