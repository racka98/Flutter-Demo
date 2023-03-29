import 'package:flutter_demo/state_management/mvvm_architecture/common/app_url.dart';
import 'package:flutter_demo/state_management/mvvm_architecture/data/network/network_api_service.dart';

class AuthRepository {
  final NetworkApiService _api;

  AuthRepository(this._api);

  Future loginApi(dynamic data) async {
    try {
      return await _api.postApiResponse(AppUrl.loginEndPint, data);
    } catch (e) {
      rethrow;
    }
  }

  Future signUpApi(dynamic data) async {
    try {
      return await _api.postApiResponse(AppUrl.registerApiEndPoint, data);
    } catch (e) {
      rethrow;
    }
  }
}
