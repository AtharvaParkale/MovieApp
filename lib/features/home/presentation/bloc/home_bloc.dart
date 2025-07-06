import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/usecase/usecase.dart';
import 'package:movie_app/features/home/domain/entities/movie.dart';
import 'package:movie_app/features/home/domain/usecases/get_now_playing_movies.dart';
import 'package:movie_app/features/home/domain/usecases/get_popular_movies.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetPopularMovies _getPopularMovies;
  final GetNowPlayingMovies _getNowPlayingMovies;

  HomeBloc({
    required GetPopularMovies getPopularMovies,
    required GetNowPlayingMovies getNowPlayingMovies,
  })  : _getPopularMovies = getPopularMovies,
        _getNowPlayingMovies = getNowPlayingMovies,
        super(HomeInitial()) {
    on<HomeEvent>((event, emit) {});
    on<GetPopularMoviesEvent>(_handleGetPopularMoviesEvent);
    on<GetNowPlayingMoviesEvent>(_handleGetNowPlayingMoviesEvent);
  }

  Future<void> _handleGetPopularMoviesEvent(
    GetPopularMoviesEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(PopularMoviesLoadingState());
    final res = await _getPopularMovies(NoParams());
    res.fold(
      (l) => emit(FailureState()),
      (r) => emit(PopularMoviesFetchedState(popularMovies: r)),
    );
  }

  Future<void> _handleGetNowPlayingMoviesEvent(
    GetNowPlayingMoviesEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(NowPlayingMoviesLoadingState());
    final res = await _getNowPlayingMovies(NoParams());
    res.fold(
      (l) => emit(FailureState()),
      (r) => emit(NowPlayingMoviesFetchedState(nowPlayingMovies: r)),
    );
  }
}
