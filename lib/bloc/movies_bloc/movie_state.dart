part of 'movie_bloc.dart';


 class MoviesState extends Equatable {
   const MoviesState({
     required this.moviesList,
 });
   final ApiResponse<MoviesModel> moviesList;
   MoviesState copyWith({
     ApiResponse<MoviesModel>? moviesList,
 }){
     return MoviesState(moviesList: moviesList ?? this.moviesList);
   }
   List<Object?> get porps => [moviesList];

  @override
  // TODO: implement props
  List<Object?> get props => [moviesList];
 }
