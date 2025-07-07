part of 'favorite_bloc.dart';

@immutable
sealed class FavoriteEvent {}

class GetAllFavoriteMoviesEvent extends FavoriteEvent {}

class AddFavoriteMovieEvent extends FavoriteEvent {
  final int movieId;

  AddFavoriteMovieEvent(this.movieId);
}

class RemoveFavoriteMovieEvent extends FavoriteEvent {
  final int movieId;

  RemoveFavoriteMovieEvent(this.movieId);
}
