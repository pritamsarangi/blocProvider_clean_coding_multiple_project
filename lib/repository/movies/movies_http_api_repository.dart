import 'package:blocprovider_clean_coding/config/app_url.dart';
import 'package:blocprovider_clean_coding/data/network/network_services.dart';
import 'package:blocprovider_clean_coding/models/movies/movies.dart';

import 'movies_repository.dart';

class MoviesHttpApiRepository implements MoviesRepository{
  final _apiServices = NetworkServicesApi();

  @override
  Future<MoviesModel> fetchMoviesList() async{
    // TODO: implement fetchMoviesList
    final response = await _apiServices.getApi(AppUrl.popularMoviesListEndPoint);
    return MoviesModel.fromJson(response);
  }
}