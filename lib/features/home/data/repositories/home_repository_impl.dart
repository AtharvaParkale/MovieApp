import 'package:fpdart/fpdart.dart';
import 'package:movie_app/core/error/failures.dart';
import 'package:movie_app/features/home/data/datasources/home_remote_datasource.dart';
import 'package:movie_app/features/home/data/models/movie_response.dart';
import 'package:movie_app/features/home/domain/entities/movie.dart';
import 'package:movie_app/features/home/domain/repository/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource remoteDataSource;

  HomeRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, Movie>> getPopularMovies() async {
    try {
      final MovieResponse response = await remoteDataSource.getPopularMovies();
      return right(response.toEntity());
    } catch (e) {
      return left(Failure('Something went wrong !'));
    }
  }
}
