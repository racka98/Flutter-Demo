import 'package:flutter/foundation.dart';
import 'package:flutter_demo/state_management/mvvm_architecture/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserViewModel extends ChangeNotifier {
  static const String _prefToken = "token";

  final _sharedPref = SharedPreferences.getInstance();

  Future<bool> saveUser(UserModel user) async {
    if (user.token != null) {
      (await _sharedPref).setString(_prefToken, user.token!);
      notifyListeners();
      return true;
    }
    return false; // Failed to save
  }

  Future<UserModel> getUser() async {
    final token = (await _sharedPref).getString(_prefToken);
    return UserModel(token: token);
  }

  Future<bool> remove() async {
    (await _sharedPref).remove(_prefToken);
    return true;
  }
}
