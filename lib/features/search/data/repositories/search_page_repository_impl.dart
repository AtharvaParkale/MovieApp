import 'package:fpdart/src/either.dart';
import 'package:movie_app/core/error/failures.dart';
import 'package:movie_app/features/home/data/models/movie_response.dart';
import 'package:movie_app/features/home/domain/entities/movie.dart';
import 'package:movie_app/features/search/data/datasources/search_page_remote_datasource.dart';
import 'package:movie_app/features/search/domain/repository/search_page_repository.dart';

class SearchPageRepositoryImpl implements SearchPageRepository {
  final SearchPageRemoteDatasource remoteDataSource;

  SearchPageRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, Movie>> searchMovies(String keyWord) async {
    try {
      final MovieResponse response =
          await remoteDataSource.searchMovies(keyWord);

      return right(response.toEntity());
    } catch (e) {
      return left(Failure('Something went wrong !'));
    }
  }
}
