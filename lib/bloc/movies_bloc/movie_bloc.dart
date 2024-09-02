import 'package:bloc/bloc.dart';
import 'package:blocprovider_clean_coding/data/response/api_response.dart';
import 'package:equatable/equatable.dart';

import '../../models/movies/movies.dart';
import '../../repository/movies/movies_repository.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  MoviesRepository moviesRepository;
  MoviesBloc({required this.moviesRepository}) : super(MoviesState(moviesList: ApiResponse.loading())) {
    on<MoviesFetched>(fetchMoviesListApi);
  }
  Future<void> fetchMoviesListApi(MoviesFetched event, Emitter<MoviesState> emit)async{
    await moviesRepository.fetchMoviesList().then((response){
      emit(state.copyWith(moviesList: ApiResponse.completed(response)));
    }).onError((error, stackTrace){
      emit(state.copyWith(moviesList: ApiResponse.error(error.toString())));

    });
  }
}
