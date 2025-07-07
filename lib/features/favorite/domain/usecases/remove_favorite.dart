import 'package:fpdart/fpdart.dart';
import 'package:movie_app/core/error/failures.dart';
import 'package:movie_app/core/usecase/usecase.dart';
import 'package:movie_app/features/favorite/domain/repository/favorite_repository.dart';
import 'package:movie_app/features/home/domain/entities/results.dart';

class RemoveFavoriteMovie implements UseCase<List<Results>, int> {
  final FavoriteRepository favoriteRepository;

  RemoveFavoriteMovie(this.favoriteRepository);

  @override
  Future<Either<Failure, List<Results>>> call(int movieId) async {
    return await favoriteRepository.removeMovieFromFavorites(movieId);
  }
}
