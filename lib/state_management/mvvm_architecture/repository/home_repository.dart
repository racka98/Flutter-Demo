import 'package:flutter_demo/state_management/mvvm_architecture/common/app_url.dart';
import 'package:flutter_demo/state_management/mvvm_architecture/data/network/network_api_service.dart';
import 'package:flutter_demo/state_management/mvvm_architecture/model/movies_model.dart';

class HomeRepository {
  final NetworkApiService _api;

  HomeRepository(this._api);

  Future<MovieListModel> fetchMoviesList() async {
    try {
      final response = await _api.getApiResponse(AppUrl.moviesListEndPoint);
      return MovieListModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
