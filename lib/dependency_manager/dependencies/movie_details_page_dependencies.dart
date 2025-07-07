import 'package:get_it/get_it.dart';
import 'package:movie_app/features/movie_details/presentation/bloc/movie_details_bloc.dart';

class MovieDetailsPageDependencies {
  static void initiateDependencies(GetIt serviceLocator) {
    // datasource
    serviceLocator.registerLazySingleton(
      () => MovieDetailsBloc(),
    );
  }
}
