import 'package:get_it/get_it.dart';
import 'package:movie_app/core/network/dio_provider.dart';
import 'package:movie_app/features/search/data/datasources/search_page_remote_datasource.dart';
import 'package:movie_app/features/search/data/repositories/search_page_repository_impl.dart';
import 'package:movie_app/features/search/domain/repository/search_page_repository.dart';
import 'package:movie_app/features/search/domain/usecases/search_movies.dart';
import 'package:movie_app/features/search/presentation/bloc/search_page_bloc.dart';

class SearchPageDependencies {
  static void initiateDependencies(GetIt serviceLocator) {
    final dio = DioProvider.createDioClient();

    // datasource
    serviceLocator
      ..registerFactory<SearchPageRemoteDatasource>(
        () => SearchPageRemoteDatasource(dio),
      )

      // Repository
      ..registerFactory<SearchPageRepository>(
        () => SearchPageRepositoryImpl(
          serviceLocator(),
        ),
      )
      // Use cases
      ..registerFactory(
        () => SearchMovies(
          serviceLocator(),
        ),
      )

      // Bloc
      ..registerLazySingleton(
        () => SearchPageBloc(
          searchMovies: serviceLocator(),
        ),
      );
  }
}
