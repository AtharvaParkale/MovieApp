import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/core/usecase/usecase.dart';
import 'package:movie_app/features/favorite/domain/usecases/add_favorite.dart';
import 'package:movie_app/features/favorite/domain/usecases/get_favorite_movies.dart';
import 'package:movie_app/features/favorite/domain/usecases/remove_favorite.dart';
import 'package:movie_app/features/home/domain/entities/results.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final GetFavoriteMovies _getFavoriteMovies;
  final AddFavoriteMovie _addFavoriteMovie;
  final RemoveFavoriteMovie _removeFavoriteMovie;

  FavoriteBloc({
    required GetFavoriteMovies getFavoriteMovies,
    required AddFavoriteMovie addFavoriteMovie,
    required RemoveFavoriteMovie removeFavoriteMovie,
  })  : _getFavoriteMovies = getFavoriteMovies,
        _addFavoriteMovie = addFavoriteMovie,
        _removeFavoriteMovie = removeFavoriteMovie,
        super(FavoriteInitial()) {
    on<GetAllFavoriteMoviesEvent>(_handleGetFavoriteMoviesEvent);
    on<AddFavoriteMovieEvent>(_handleAddFavoriteMovieEvent);
    on<RemoveFavoriteMovieEvent>(_handleRemoveFavoriteMovieEvent);
  }

  Future<void> _handleGetFavoriteMoviesEvent(
    GetAllFavoriteMoviesEvent event,
    Emitter<FavoriteState> emit,
  ) async {
    emit(LoadingState());
    final result = await _getFavoriteMovies(NoParams());

    result.fold(
      (failure) => emit(ErrorState(failure.message)),
      (favorites) => emit(FavoriteMoviesFetchedState(favorites)),
    );
  }

  Future<void> _handleAddFavoriteMovieEvent(
    AddFavoriteMovieEvent event,
    Emitter<FavoriteState> emit,
  ) async {
    final res = await _addFavoriteMovie(event.movieId);

    res.fold(
      (l) => emit(ErrorState('Failed to add favorite')),
      (r) => emit(FavoriteAddSuccess(r)),
    );
  }

  Future<void> _handleRemoveFavoriteMovieEvent(
    RemoveFavoriteMovieEvent event,
    Emitter<FavoriteState> emit,
  ) async {
    final res = await _removeFavoriteMovie(event.movieId);
    res.fold(
      (l) => emit(ErrorState('Failed to remove favorite')),
      (r) => emit(FavoriteRemoveSuccess(r)),
    );
  }
}
