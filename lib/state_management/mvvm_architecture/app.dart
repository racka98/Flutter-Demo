import 'package:flutter/material.dart';
import 'package:flutter_demo/state_management/mvvm_architecture/data/network/network_api_service.dart';
import 'package:flutter_demo/state_management/mvvm_architecture/repository/auth_repository.dart';
import 'package:flutter_demo/state_management/mvvm_architecture/utils/routes/routes.dart';
import 'package:flutter_demo/state_management/mvvm_architecture/utils/routes/routes_name.dart';
import 'package:flutter_demo/state_management/mvvm_architecture/view_model/auth_view_model.dart';
import 'package:flutter_demo/state_management/mvvm_architecture/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class MvvmApp extends StatelessWidget {
  const MvvmApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) =>
                AuthViewModel(AuthRepository(NetworkApiService()))),
        ChangeNotifierProvider(create: (context) => UserViewModel()),
      ],
      child: MaterialApp(
        title: "MVVM Arch",
        theme: ThemeData(primarySwatch: Colors.indigo),
        initialRoute: RoutesName.splash,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
