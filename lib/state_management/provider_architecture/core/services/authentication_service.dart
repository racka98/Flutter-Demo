import 'dart:async';

import 'package:flutter_demo/state_management/provider_architecture/core/models/user.dart';
import 'package:flutter_demo/state_management/provider_architecture/core/services/api.dart';
import 'package:flutter_demo/state_management/provider_architecture/locator.dart';

class AuthenticationService {
  final _api = locator<Api>();

  final userController = StreamController<User>();

  Future<bool> login(int userId) async {
    final fetchUser = await _api.getUserProfile(userId);
    final hasUser = fetchUser != null;
    if (hasUser) {
      userController.add(fetchUser);
    }
    return hasUser;
  }
}
