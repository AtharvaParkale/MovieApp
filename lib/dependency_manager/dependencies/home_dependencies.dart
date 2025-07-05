import 'package:get_it/get_it.dart';
import 'package:movie_app/features/home/presentation/bloc/home_bloc.dart';

class HomeDependencies {
  static void initiateDependencies(GetIt serviceLocator) {
    serviceLocator.registerLazySingleton<HomeBloc>(
          () => HomeBloc(),
    );
  }
}
