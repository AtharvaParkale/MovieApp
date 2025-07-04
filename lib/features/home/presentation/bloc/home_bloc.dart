import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/usecase/usecase.dart';
import 'package:movie_app/features/home/domain/entities/movie.dart';
import 'package:movie_app/features/home/domain/usecases/get_popular_movies.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetPopularMovies _getPopularMovies;

  HomeBloc({
    required GetPopularMovies getPopularMovies,
  })  : _getPopularMovies = getPopularMovies,
        super(HomeInitial()) {
    on<HomeEvent>((event, emit) {});
    on<GetPopularMoviesEvent>(_handleGetPopularMoviesEvent);
  }

  Future<void> _handleGetPopularMoviesEvent(
    GetPopularMoviesEvent event,
    Emitter<HomeState> emit,
  ) async {
    final res = await _getPopularMovies(NoParams());

    res.fold(
      (l) => emit(FailureState()),
      (r) => emit(PopularMoviesFetchedState(popularMovies: r)),
    );
  }
}
