import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_demo/state_management/mvvm_architecture/model/user_model.dart';
import 'package:flutter_demo/state_management/mvvm_architecture/repository/auth_repository.dart';
import 'package:flutter_demo/state_management/mvvm_architecture/utils/routes/routes_name.dart';
import 'package:flutter_demo/state_management/mvvm_architecture/utils/utils.dart';
import 'package:flutter_demo/state_management/mvvm_architecture/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class AuthViewModel extends ChangeNotifier {
  final AuthRepository _repo;

  AuthViewModel(this._repo);

  bool _loading = false;

  bool get loading => _loading;

  bool _signUpLoading = false;

  bool get signUpLoading => _signUpLoading;

  void setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  void setSignUpLoading(bool value) {
    _signUpLoading = value;
    notifyListeners();
  }

  Future<void> loginApi(
    dynamic data,
    BuildContext context, {
    required void Function(String route) onNav,
  }) async {
    setLoading(true);
    _repo.loginApi(data).then(
      (value) {
        setLoading(false);
        final userPreference =
            Provider.of<UserViewModel>(context, listen: false);
        userPreference.saveUser(UserModel(token: value["token"]));
        Utils.flushBarErrorMessage("Login Successfully", context);
        onNav(RoutesName.home);
        if (kDebugMode) {
          print("Login Data: $value");
        }
      },
    ).onError(
      (error, stackTrace) {
        setLoading(false);
        Utils.flushBarErrorMessage(error.toString(), context);
        if (kDebugMode) print(error.toString());
      },
    );
  }

  Future<void> signUpApi(
    dynamic data,
    BuildContext context, {
    required void Function(String route) onNav,
  }) async {
    setSignUpLoading(true);
    _repo.signUpApi(data).then(
      (value) {
        setSignUpLoading(false);
        final userPreference =
            Provider.of<UserViewModel>(context, listen: false);
        userPreference.saveUser(UserModel(token: value["token"]));
        Utils.flushBarErrorMessage("Signup Successfully", context);
        onNav(RoutesName.home);
        if (kDebugMode) print("Signup Data: $value");
      },
    ).onError(
      (error, stackTrace) {
        setSignUpLoading(false);
        Utils.flushBarErrorMessage(error.toString(), context);
        if (kDebugMode) print(error.toString());
      },
    );
  }
}
