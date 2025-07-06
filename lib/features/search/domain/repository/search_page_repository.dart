import 'package:fpdart/fpdart.dart';
import 'package:movie_app/core/error/failures.dart';
import 'package:movie_app/features/home/domain/entities/movie.dart';

abstract interface class SearchPageRepository {
  Future<Either<Failure, Movie>> searchMovies(String keyWord);
}
