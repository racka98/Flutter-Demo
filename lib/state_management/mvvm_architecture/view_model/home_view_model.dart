import 'package:flutter/foundation.dart';
import 'package:flutter_demo/state_management/mvvm_architecture/data/response/api_response.dart';
import 'package:flutter_demo/state_management/mvvm_architecture/model/movies_model.dart';
import 'package:flutter_demo/state_management/mvvm_architecture/repository/home_repository.dart';

class HomeViewModel extends ChangeNotifier {
  final HomeRepository _repo;

  HomeViewModel(this._repo);

  ApiResponse<MovieListModel> moviesList = ApiResponse.loading();

  void _setMoviesList(ApiResponse<MovieListModel> response) {
    moviesList = response;
    notifyListeners();
  }

  Future<void> fetchMoviesList() async {
    _setMoviesList(ApiResponse.loading());
    _repo.fetchMoviesList().then(
      (value) {
        _setMoviesList(ApiResponse.completed(value));
      },
    ).onError(
      (error, stackTrace) {
        _setMoviesList(ApiResponse.error(error.toString()));
        if (kDebugMode) print(error.toString());
      },
    );
  }
}
