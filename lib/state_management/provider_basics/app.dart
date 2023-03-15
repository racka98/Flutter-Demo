import 'package:flutter/material.dart';
import 'package:flutter_demo/state_management/provider_basics/providers/counter_provider.dart';
import 'package:flutter_demo/state_management/provider_basics/providers/shopping_cart_provider.dart';
import 'package:flutter_demo/state_management/provider_basics/screens/home_screen.dart';
import 'package:flutter_demo/state_management/provider_basics/screens/second_screen.dart';
import 'package:provider/provider.dart';

class ProviderBasicsApp extends StatelessWidget {
  const ProviderBasicsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Counter()),
        ChangeNotifierProvider(create: (context) => ShoppingCart()),
      ],
      child: MaterialApp(
        title: "Provider Basics",
        theme: ThemeData(primarySwatch: Colors.lime),
        initialRoute: "/",
        routes: {
          "/": (context) => const MyHomePage(),
          "/second": (context) => const SecondPage(),
        },
      ),
    );
  }
}
