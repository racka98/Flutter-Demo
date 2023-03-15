import 'package:flutter/foundation.dart';
import 'package:flutter_demo/state_management/provider_architecture/core/services/authentication_service.dart';
import 'package:flutter_demo/state_management/provider_architecture/locator.dart';

// ignore: constant_identifier_names
enum ViewState { Idle, Busy }

class LoginModel extends ChangeNotifier {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();

  ViewState _state = ViewState.Idle;

  ViewState get state => _state;

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }

  Future<bool> login(String userIdText) async {
    setState(ViewState.Busy);
    final userId = int.tryParse(userIdText);
    final success =
        userId != null ? await _authenticationService.login(userId) : false;
    setState(ViewState.Idle);
    return success;
  }
}
