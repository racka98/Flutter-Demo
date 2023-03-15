import 'package:flutter_demo/state_management/provider_architecture/core/services/api.dart';
import 'package:flutter_demo/state_management/provider_architecture/locator.dart';

class AuthenticationService {
  final _api = locator<Api>();

  Future<bool> login(int userId) async {
    final fetchUser = await _api.getUserProfile(userId);
    return fetchUser != null;
  }
}
