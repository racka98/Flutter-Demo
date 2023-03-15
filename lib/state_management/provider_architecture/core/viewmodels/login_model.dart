import 'package:flutter_demo/state_management/provider_architecture/core/enums/view_state.dart';
import 'package:flutter_demo/state_management/provider_architecture/core/services/authentication_service.dart';
import 'package:flutter_demo/state_management/provider_architecture/core/viewmodels/ui_notifier.dart';
import 'package:flutter_demo/state_management/provider_architecture/locator.dart';

class LoginModel extends UiNotifier {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();

  Future<bool> login(String userIdText) async {
    setState(ViewState.Busy);
    final userId = int.tryParse(userIdText);
    final success =
        userId != null ? await _authenticationService.login(userId) : false;
    setState(ViewState.Idle);
    return success;
  }
}
