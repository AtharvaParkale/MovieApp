import 'package:get_it/get_it.dart';
import 'package:movie_app/core/network/dio_provider.dart';
import 'package:movie_app/features/home/data/datasources/home_remote_datasource.dart';
import 'package:movie_app/features/home/data/repositories/home_repository_impl.dart';
import 'package:movie_app/features/home/domain/repository/home_repository.dart';
import 'package:movie_app/features/home/domain/usecases/get_popular_movies.dart';
import 'package:movie_app/features/home/presentation/bloc/home_bloc.dart';

class HomeDependencies {
  static void initiateDependencies(GetIt serviceLocator) {
    final dio = DioProvider.createDioClient();

    // datasource
    serviceLocator
      ..registerFactory<HomeRemoteDataSource>(
        () => HomeRemoteDataSource(dio),
      )

      // Repository
      ..registerFactory<HomeRepository>(
        () => HomeRepositoryImpl(
          serviceLocator(),
        ),
      )
      // Use cases
      ..registerFactory(
        () => GetPopularMovies(
          serviceLocator(),
        ),
      )

      // Bloc
      ..registerFactory(() {
        final bloc = HomeBloc(getPopularMovies: serviceLocator());
        bloc.add(GetPopularMoviesEvent());
        return bloc;
      });
  }
}
