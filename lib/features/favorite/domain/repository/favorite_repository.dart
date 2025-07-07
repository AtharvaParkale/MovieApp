import 'package:fpdart/fpdart.dart';
import 'package:movie_app/core/error/failures.dart';
import 'package:movie_app/features/home/domain/entities/results.dart';

abstract interface class FavoriteRepository {
  Future<Either<Failure, List<Results>>> getFavoriteMovies();

  Future<Either<Failure, Results>> addMovieToFavorites(int movieId);

  Future<Either<Failure, List<Results>>> removeMovieFromFavorites(int movieId);
}
