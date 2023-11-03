import 'package:mvvm_flutter_provider/data/network/base_api_services.dart';
import 'package:mvvm_flutter_provider/data/network/network_api_services.dart';
import 'package:mvvm_flutter_provider/model/movie_model.dart';
import 'package:mvvm_flutter_provider/resources/constant/auth_url.dart';

class HomeRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<MovieModel> getMovieList() async {
    try {
      dynamic response =
          await _apiServices.getGetApiResponse(AppUrl.moviesListEndPoint);

      return response = MovieModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
