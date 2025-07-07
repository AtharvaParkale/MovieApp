import 'package:get_it/get_it.dart';
import 'package:movie_app/core/network/dio_provider.dart';
import 'package:movie_app/features/favorite/data/datasources/favorite_remote_datasource.dart';
import 'package:movie_app/features/favorite/data/repositories/favorite_repository_impl.dart';
import 'package:movie_app/features/favorite/domain/repository/favorite_repository.dart';
import 'package:movie_app/features/favorite/domain/usecases/add_favorite.dart';
import 'package:movie_app/features/favorite/domain/usecases/get_favorite_movies.dart';
import 'package:movie_app/features/favorite/domain/usecases/remove_favorite.dart';
import 'package:movie_app/features/favorite/presentation/bloc/favorite_bloc.dart';

class FavoriteDependencies {
  static void initiateDependencies(GetIt serviceLocator) {
    final dio = DioProvider.createDioClient();
    // datasource
    serviceLocator
      ..registerFactory<FavoriteRemoteDatasource>(
        () => FavoriteRemoteDatasource(dio),
      )

      // Repository
      ..registerFactory<FavoriteRepository>(
        () => FavoriteRepositoryImpl(
          serviceLocator(),
        ),
      )
      // Use cases
      ..registerFactory(
        () => GetFavoriteMovies(
          serviceLocator(),
        ),
      )
      ..registerFactory(
        () => AddFavoriteMovie(
          serviceLocator(),
        ),
      )
      ..registerFactory(
        () => RemoveFavoriteMovie(
          serviceLocator(),
        ),
      )

      // Bloc
      ..registerLazySingleton(
        () => FavoriteBloc(
          getFavoriteMovies: serviceLocator(),
          addFavoriteMovie: serviceLocator(),
          removeFavoriteMovie: serviceLocator(),
        ),
      );
  }
}
