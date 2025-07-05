import 'package:fpdart/fpdart.dart';
import 'package:movie_app/core/error/failures.dart';
import 'package:movie_app/features/home/domain/entities/movie.dart';

abstract interface class HomeRepository {
  Future<Either<Failure, Movie>> getPopularMovies();
}
