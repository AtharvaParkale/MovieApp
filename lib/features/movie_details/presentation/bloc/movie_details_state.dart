part of 'movie_details_bloc.dart';

@immutable
sealed class MovieDetailsState {}

final class MovieDetailsInitial extends MovieDetailsState {}

class FavoriteAddSuccess extends MovieDetailsState {
  final List<int> movieIds;

  FavoriteAddSuccess(this.movieIds);
}

class FavoriteRemoveSuccess extends MovieDetailsState {
  final List<int> movieIds;

  FavoriteRemoveSuccess(this.movieIds);
}

class GetAllFavoriteMovies extends MovieDetailsState {
  final List<int> movieIds;

  GetAllFavoriteMovies(this.movieIds);
}
