part of 'movie_bloc.dart';

abstract class MoviesEvent extends Equatable{
  @override
  List<Object> get props => [];
}
class MoviesFetched extends MoviesEvent{}
