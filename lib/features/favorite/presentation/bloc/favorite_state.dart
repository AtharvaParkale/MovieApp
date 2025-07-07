part of 'favorite_bloc.dart';

@immutable
sealed class FavoriteState {}

class FavoriteInitial extends FavoriteState {}

class LoadingState extends FavoriteState {}

class FavoriteMoviesFetchedState extends FavoriteState {
  final List<Results> favoriteMovies;

  FavoriteMoviesFetchedState(this.favoriteMovies);
}

class FavoriteAddSuccess extends FavoriteState {
  final Results result;

  FavoriteAddSuccess(this.result);
}

class FavoriteRemoveSuccess extends FavoriteState {
  final List<Results> favoriteMovies;

  FavoriteRemoveSuccess(this.favoriteMovies);
}

class ErrorState extends FavoriteState {
  final String message;

  ErrorState(this.message);
}
