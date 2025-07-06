import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/common/widgets/app_bar_widget.dart';
import 'package:movie_app/core/common/widgets/scaffold_widget.dart';
import 'package:movie_app/core/constants/app_dimensions.dart';
import 'package:movie_app/features/home/domain/entities/results.dart';
import 'package:movie_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:movie_app/features/home/presentation/widgets/now_playing_widget.dart';
import 'package:movie_app/features/home/presentation/widgets/trending_now_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Results> popularMovies = [];
  List<Results> nowPlayingMovies = [];

  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(GetPopularMoviesEvent());
    context.read<HomeBloc>().add(GetNowPlayingMoviesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppBarWidget(),
      ),
      body: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is PopularMoviesFetchedState) {
            popularMovies = state.popularMovies.results;
          } else if (state is NowPlayingMoviesFetchedState) {
            nowPlayingMovies = state.nowPlayingMovies.results;
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                const SizedBox(height: AppDimensions.size20),
                TrendingNowWidget(movies: popularMovies),
                const SizedBox(height: AppDimensions.size16),
                NowPlayingWidget(movies: nowPlayingMovies),
              ],
            ),
          );
        },
      ),
    );
  }
}
