import 'package:flutter_demo/state_management/provider_architecture/core/enums/view_state.dart';
import 'package:flutter_demo/state_management/provider_architecture/core/services/authentication_service.dart';
import 'package:flutter_demo/state_management/provider_architecture/locator.dart';
import 'package:flutter_demo/state_management/provider_architecture/provider/ui_notifier.dart';

class LoginModel extends UiNotifier {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();

  String errorMessage = "";

  Future<bool> login(String userIdText) async {
    setState(ViewState.Busy);
    final userId = int.tryParse(userIdText);
    if (userId == null) {
      errorMessage = "Value Entered is not a number!";
      setState(ViewState.Idle);
      return false;
    }
    final success = await _authenticationService.login(userId);
    setState(ViewState.Idle);
    return success;
  }
}
