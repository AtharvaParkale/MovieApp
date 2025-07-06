import 'package:fpdart/fpdart.dart';
import 'package:movie_app/core/error/failures.dart';
import 'package:movie_app/core/usecase/usecase.dart';
import 'package:movie_app/features/home/domain/entities/movie.dart';
import 'package:movie_app/features/search/domain/repository/search_page_repository.dart';

class SearchMovies implements UseCase<Movie, String> {
  final SearchPageRepository searchPageRepository;

  SearchMovies(this.searchPageRepository);

  @override
  Future<Either<Failure, Movie>> call(String keyWord) async {
    return await searchPageRepository.searchMovies(keyWord);
  }
}
