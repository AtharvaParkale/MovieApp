import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:movie_app/dependency_manager/init_dependencies.main.dart';
import 'package:movie_app/features/favorite/presentation/bloc/favorite_bloc.dart';
import 'package:movie_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:movie_app/features/movie_details/presentation/bloc/movie_details_bloc.dart';
import 'package:movie_app/features/search/presentation/bloc/search_page_bloc.dart';
import 'package:movie_app/features/stack_home/presentation/pages/stack_home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (_) => serviceLocator<HomeBloc>(),
      ),
      BlocProvider(
        create: (_) => serviceLocator<SearchPageBloc>(),
      ),
      BlocProvider(
        create: (_) => serviceLocator<FavoriteBloc>(),
      ),
      BlocProvider(
        create: (_) => serviceLocator<MovieDetailsBloc>(),
      ),
    ],
    child: const MyApp(),
  ));
}

final RouteObserver<ModalRoute> routeObserver = RouteObserver<ModalRoute>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorObservers: [routeObserver],
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
        Locale('es', ''),
      ],
      debugShowCheckedModeBanner: false,
      title: 'Movie App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const StackHome(),
    );
  }
}
