import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/core/utils/common_methods.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsBloc() : super(MovieDetailsInitial()) {
    on<AddFavoriteMovieEvent>(_handleAddFavoriteMovieEvent);
    on<RemoveFavoriteMovieEvent>(_handleRemoveFavoriteMovieEvent);
    on<GetFavouriteMovieIdsEvent>(_handleGetFavouriteMovieIdsEvent);
  }

  Future<void> _handleAddFavoriteMovieEvent(
    AddFavoriteMovieEvent event,
    Emitter<MovieDetailsState> emit,
  ) async {
    List<int> favMovieIds =
        await CommonMethods().addMovieIdToFavorites(event.movieId);

    emit(FavoriteAddSuccess(favMovieIds));
  }

  Future<void> _handleRemoveFavoriteMovieEvent(
    RemoveFavoriteMovieEvent event,
    Emitter<MovieDetailsState> emit,
  ) async {
    List<int> favMovieIds =
        await CommonMethods().removeMovieIdFromFavorites(event.movieId);
    emit(FavoriteRemoveSuccess(favMovieIds));
  }

  Future<void> _handleGetFavouriteMovieIdsEvent(
    GetFavouriteMovieIdsEvent event,
    Emitter<MovieDetailsState> emit,
  ) async {
    List<int> favMovieIds = await CommonMethods().getFavoriteMovieIds();
    emit(GetAllFavoriteMovies(favMovieIds));
  }
}
