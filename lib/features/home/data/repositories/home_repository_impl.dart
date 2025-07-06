import 'package:fpdart/fpdart.dart';
import 'package:movie_app/core/constants/app_enums.dart';
import 'package:movie_app/core/error/failures.dart';
import 'package:movie_app/features/home/data/datasources/home_local_datasource.dart';
import 'package:movie_app/features/home/data/datasources/home_remote_datasource.dart';
import 'package:movie_app/features/home/data/models/movie_response.dart';
import 'package:movie_app/features/home/domain/entities/movie.dart';
import 'package:movie_app/features/home/domain/repository/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource remoteDataSource;
  final HomeLocalDataSource localDataSource;

  HomeRepositoryImpl(
    this.remoteDataSource,
    this.localDataSource,
  );

  @override
  Future<Either<Failure, Movie>> getPopularMovies() async {
    try {
      final cachedMovieResponse = await localDataSource.getResultsFromPrefs(
        ApiTag.popularMovies,
      );

      if (cachedMovieResponse == null) {
        final MovieResponse response =
            await remoteDataSource.getPopularMovies();

        await localDataSource.saveResultsToPrefs(
          response,
          ApiTag.popularMovies,
        );
        return right(response.toEntity());
      } else {
        return right(cachedMovieResponse.toEntity());
      }
    } catch (e) {
      return left(Failure('Something went wrong !'));
    }
  }

  @override
  Future<Either<Failure, Movie>> getNowPlayingMovies() async {
    try {
      final cachedMovieResponse = await localDataSource.getResultsFromPrefs(
        ApiTag.nowPlayingMovies,
      );

      if (cachedMovieResponse == null) {
        final MovieResponse response =
            await remoteDataSource.getNowPlayingMovies();

        await localDataSource.saveResultsToPrefs(
          response,
          ApiTag.nowPlayingMovies,
        );
        return right(response.toEntity());
      } else {
        return right(cachedMovieResponse.toEntity());
      }
    } catch (e) {
      return left(Failure('Something went wrong !'));
    }
  }
}
