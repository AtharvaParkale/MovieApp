part of 'movie_details_bloc.dart';

@immutable
sealed class MovieDetailsEvent {}

class AddFavoriteMovieEvent extends MovieDetailsEvent {
  final int movieId;

  AddFavoriteMovieEvent({required this.movieId});
}

class RemoveFavoriteMovieEvent extends MovieDetailsEvent {
  final int movieId;

  RemoveFavoriteMovieEvent({required this.movieId});
}

class GetFavouriteMovieIdsEvent extends MovieDetailsEvent {}
