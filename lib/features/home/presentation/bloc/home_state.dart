part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class PopularMoviesFetchedState extends HomeState {
  final Movie popularMovies;

  PopularMoviesFetchedState({
    required this.popularMovies,
  });
}

final class NowPlayingMoviesFetchedState extends HomeState {
  final Movie nowPlayingMovies;

  NowPlayingMoviesFetchedState({
    required this.nowPlayingMovies,
  });
}

final class FailureState extends HomeState {}

final class PopularMoviesLoadingState extends HomeState {}

final class NowPlayingMoviesLoadingState extends HomeState {}
