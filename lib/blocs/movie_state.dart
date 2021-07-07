import 'package:movie_list_flutter/models/movie.dart';

class MovieState {
  MovieState();
}

class MovieInitialState extends MovieState {
  MovieInitialState();
}

class MovieLoadingState extends MovieState {
  String message;

  MovieLoadingState(this.message);
}

class MovieSuccessState extends MovieState {
  List<Movie> movies;

  MovieSuccessState(this.movies);
}

class MovieErrorState extends MovieState {}
