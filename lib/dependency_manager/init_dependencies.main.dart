import 'package:get_it/get_it.dart';
import 'package:movie_app/dependency_manager/dependencies/favorite_dependencies.dart';
import 'package:movie_app/dependency_manager/dependencies/movie_details_page_dependencies.dart';
import 'package:movie_app/dependency_manager/dependencies/search_page_dependencies.dart';

import 'dependencies/home_dependencies.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  HomeDependencies.initiateDependencies(serviceLocator);
  SearchPageDependencies.initiateDependencies(serviceLocator);
  FavoriteDependencies.initiateDependencies(serviceLocator);
  MovieDetailsPageDependencies.initiateDependencies(serviceLocator);
}
