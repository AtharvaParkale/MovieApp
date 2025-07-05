import 'package:get_it/get_it.dart';

import 'dependencies/home_dependencies.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  HomeDependencies.initiateDependencies(serviceLocator);
}
