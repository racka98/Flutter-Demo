import 'package:flutter/foundation.dart';
import 'package:flutter_demo/state_management/mvvm_architecture/model/user_model.dart';
import 'package:flutter_demo/state_management/mvvm_architecture/utils/routes/routes_name.dart';
import 'package:flutter_demo/state_management/mvvm_architecture/view_model/user_view_model.dart';

class SplashServices {
  final _userViewModel = UserViewModel();

  Future<UserModel> _getUserData() => _userViewModel.getUser();

  void checkAuthentication(
    void Function({required String route}) onNavigate,
  ) async {
    _getUserData().then(
      (value) async {
        if (kDebugMode) {
          print("Token is ${value.token}");
        }
        if (value.token == null || value.token == "") {
          await Future.delayed(const Duration(seconds: 3));
          onNavigate(route: RoutesName.login);
        } else {
          await Future.delayed(const Duration(seconds: 3));
          onNavigate(route: RoutesName.home);
        }
      },
    ).onError(
      (error, stackTrace) {
        if (kDebugMode) print(error.toString());
      },
    );
  }
}
