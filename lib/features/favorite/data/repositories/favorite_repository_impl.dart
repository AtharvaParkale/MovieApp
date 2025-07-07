import 'package:fpdart/fpdart.dart';
import 'package:movie_app/core/constants/constants.dart';
import 'package:movie_app/core/error/failures.dart';
import 'package:movie_app/features/favorite/data/datasources/favorite_remote_datasource.dart';
import 'package:movie_app/features/favorite/data/models/movie_detail_model.dart';
import 'package:movie_app/features/favorite/domain/repository/favorite_repository.dart';
import 'package:movie_app/features/home/data/models/results_model.dart';
import 'package:movie_app/features/home/domain/entities/results.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteRepositoryImpl implements FavoriteRepository {
  final FavoriteRemoteDatasource remoteDatasource;

  FavoriteRepositoryImpl(this.remoteDatasource);

  @override
  Future<Either<Failure, List<Results>>> getFavoriteMovies() async {
    try {
      List<ResultsModel> favouriteMovieData = [];

      final prefs = await SharedPreferences.getInstance();
      final favMovieIds = prefs.getStringList(Constants.favoriteMovies) ?? [];

      final favMovieIdsParsed = favMovieIds.map(int.parse).toList();

      for (final id in favMovieIdsParsed) {
        try {
          final movieModel = await remoteDatasource.getMovieById(id);
          ResultsModel resultModel = ResultsModel(
            id: movieModel.id,
            title: movieModel.title,
            posterPath: movieModel.posterPath,
            voteAverage: movieModel.voteAverage,
            backdropPath: movieModel.backdropPath,
          );
          favouriteMovieData.add(resultModel);
        } catch (_) {
          continue;
        }
      }

      final List<Results> favoriteEntities =
          favouriteMovieData.map((model) => model.toEntity()).toList();

      return right(favoriteEntities);
    } catch (e) {
      return left(Failure('Failed to add movie to favorites'));
    }
  }

  @override
  Future<Either<Failure, Results>> addMovieToFavorites(int movieId) async {
    try {
      final prefs = await SharedPreferences.getInstance();

      final favMovieIds = prefs.getStringList(Constants.favoriteMovies) ?? [];
      final favMovieIdsParsed = favMovieIds.map(int.parse).toList();

      if (favMovieIdsParsed.contains(movieId)) {
        return left(Failure('Movie is already in favorites'));
      }

      MovieDetailModel movie = await remoteDatasource.getMovieById(movieId);

      ResultsModel result = ResultsModel(
        id: movie.id,
        title: movie.title,
        posterPath: movie.posterPath ?? '',
        voteAverage: movie.voteAverage ?? 0.0,
        backdropPath: movie.backdropPath ?? '',
      );

      favMovieIdsParsed.add(movieId);
      final updatedList = favMovieIdsParsed.map((id) => id.toString()).toList();
      await prefs.setStringList(Constants.favoriteMovies, updatedList);

      return right(result.toEntity());
    } catch (e) {
      return left(Failure('Failed to add movie to favorites'));
    }
  }

  @override
  Future<Either<Failure, List<Results>>> removeMovieFromFavorites(
    int movieId,
  ) async {
    try {
      final prefs = await SharedPreferences.getInstance();

      final favMovieIds = prefs.getStringList(Constants.favoriteMovies) ?? [];
      final favMovieIdsParsed = favMovieIds.map(int.parse).toList();

      if (!favMovieIdsParsed.contains(movieId)) {
        return left(Failure('Movie is not in favorites'));
      }

      favMovieIdsParsed.remove(movieId);

      final updatedList = favMovieIdsParsed.map((id) => id.toString()).toList();
      await prefs.setStringList(Constants.favoriteMovies, updatedList);

      List<ResultsModel> favoriteMovies = [];

      for (int id in favMovieIdsParsed) {
        try {
          final movie = await remoteDatasource.getMovieById(id);
          favoriteMovies.add(ResultsModel(
            id: movie.id,
            title: movie.title,
            posterPath: movie.posterPath ?? '',
            voteAverage: movie.voteAverage ?? 0.0,
            backdropPath: movie.backdropPath ?? '',
          ));
        } catch (_) {}
      }

      final results = favoriteMovies.map((m) => m.toEntity()).toList();
      return right(results);
    } catch (e) {
      return left(Failure('Failed to remove movie from favorites'));
    }
  }
}
