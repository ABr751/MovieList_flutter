import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:movie_list_flutter/blocs/movie_event.dart';
import 'package:movie_list_flutter/blocs/movie_state.dart';
import 'package:movie_list_flutter/models/movie.dart';
import 'package:movie_list_flutter/models/movie_data.dart';
import 'package:bloc/bloc.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  int page = 1;
  final int pageSize = 20;
  List<Movie> movies =[];

  MovieBloc() : super(MovieInitialState());

  Future<MovieData> loadMovies(int pageNum, int pageSize) async {
    final response = rootBundle
        .loadString('assets/data/CONTENTLISTINGPAGE-PAGE$pageNum.json');
    var data = jsonDecode(await response);
    print("Hurray.....decode success ");
    var finalResponse = MovieData.fromJson(data);
    return finalResponse;
  }

  @override
  Stream<MovieState> mapEventToState(MovieEvent event) async* {
    if (event is Fetch) {
      try {
        yield MovieLoadingState('Loading Movies');
        final response = await loadMovies(page, pageSize);
        yield MovieSuccessState(response.page.contentItems.content);
        page++;
      } catch (e) {
        print(e.toString());
        yield MovieErrorState();
      }
    }
  }
}
