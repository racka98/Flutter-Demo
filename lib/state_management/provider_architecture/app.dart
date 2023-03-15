import 'package:flutter/material.dart';
import 'package:flutter_demo/state_management/provider_architecture/locator.dart';
import 'package:flutter_demo/state_management/provider_architecture/ui/router.dart'
    as router;

Widget providerApp() {
  setupLocator();
  return const ProviderArchApp();
}

class ProviderArchApp extends StatelessWidget {
  const ProviderArchApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Provider Architecture",
      theme: ThemeData(primarySwatch: Colors.cyan),
      initialRoute: "/login",
      onGenerateRoute: router.Router.generateRoute,
    );
  }
}
