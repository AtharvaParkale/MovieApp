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

final class FailureState extends HomeState {}
