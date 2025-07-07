import 'package:fpdart/fpdart.dart';
import 'package:movie_app/core/error/failures.dart';
import 'package:movie_app/core/usecase/usecase.dart';
import 'package:movie_app/features/favorite/domain/repository/favorite_repository.dart';
import 'package:movie_app/features/home/domain/entities/results.dart';

class AddFavoriteMovie implements UseCase<Results, int> {
  final FavoriteRepository favoriteRepository;

  AddFavoriteMovie(this.favoriteRepository);

  @override
  Future<Either<Failure, Results>> call(int movieId) async {
    return await favoriteRepository.addMovieToFavorites(movieId);
  }
}
