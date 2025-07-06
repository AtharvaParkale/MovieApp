part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

final class GetPopularMoviesEvent extends HomeEvent {}

final class GetNowPlayingMoviesEvent extends HomeEvent {}
