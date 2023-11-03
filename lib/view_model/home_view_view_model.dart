import 'package:flutter/foundation.dart';
import 'package:mvvm_flutter_provider/data/response/api_response.dart';
import 'package:mvvm_flutter_provider/model/movie_model.dart';
import 'package:mvvm_flutter_provider/repository/home_repo.dart';

class HomeViewViewmodel with ChangeNotifier {
  final _myRepo = HomeRepository();

  ApiResponse<MovieModel> moviesList = ApiResponse.loading();

  setMovieList(ApiResponse<MovieModel> response) {
    moviesList = response;
    notifyListeners();
  }

  Future<void> fetchMovieList() async {
    setMovieList(ApiResponse.loading());

    await _myRepo.getMovieList().then((value) {
      print("before Update");
      setMovieList(ApiResponse.completed(value));

      print(value.movies!.length);
    }).onError((error, stackTrace) {
      setMovieList(ApiResponse.error(error.toString()));

      print(error);
    });
  }
}
