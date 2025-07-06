import 'package:fpdart/fpdart.dart';
import 'package:movie_app/core/error/failures.dart';
import 'package:movie_app/core/usecase/usecase.dart';
import 'package:movie_app/features/home/domain/entities/movie.dart';
import 'package:movie_app/features/home/domain/repository/home_repository.dart';

class GetNowPlayingMovies implements UseCase<Movie, NoParams> {
  final HomeRepository homeRepository;

  GetNowPlayingMovies(this.homeRepository);

  @override
  Future<Either<Failure, Movie>> call(NoParams params) async {
    return await homeRepository.getNowPlayingMovies();
  }
}
