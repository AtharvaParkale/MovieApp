import 'package:fpdart/fpdart.dart';
import 'package:movie_app/core/error/failures.dart';
import 'package:movie_app/core/usecase/usecase.dart';
import 'package:movie_app/features/favorite/domain/repository/favorite_repository.dart';
import 'package:movie_app/features/home/domain/entities/results.dart';

class GetFavoriteMovies implements UseCase<List<Results>, NoParams> {
  final FavoriteRepository favoriteRepository;

  GetFavoriteMovies(this.favoriteRepository);

  @override
  Future<Either<Failure, List<Results>>> call(NoParams params) async {
    return await favoriteRepository.getFavoriteMovies();
  }
}
