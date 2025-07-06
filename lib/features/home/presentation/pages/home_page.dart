import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/common/widgets/app_bar_widget.dart';
import 'package:movie_app/core/common/widgets/scaffold_widget.dart';
import 'package:movie_app/core/constants/app_dimensions.dart';
import 'package:movie_app/core/data/dummy_data.dart';
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
  List<Results> popularMovies = DummyData.dummyResults;
  List<Results> nowPlayingMovies = DummyData.dummyResults;
  bool isPopularMoviesLoading = true;
  bool isNowPlayingMoviesLoading = true;

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
            isPopularMoviesLoading = false;
          } else if (state is NowPlayingMoviesFetchedState) {
            nowPlayingMovies = state.nowPlayingMovies.results;
            isNowPlayingMoviesLoading = false;
          }
        },
        buildWhen: (previous, current) => _buildWhen(current),
        builder: (context, state) {
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                const SizedBox(height: AppDimensions.size20),
                TrendingNowWidget(
                  movies: popularMovies,
                  isLoading: isPopularMoviesLoading,
                ),
                const SizedBox(height: AppDimensions.size16),
                NowPlayingWidget(
                  movies: nowPlayingMovies,
                  isLoading: isNowPlayingMoviesLoading,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  bool _buildWhen(HomeState current) {
    return current is PopularMoviesFetchedState ||
        current is PopularMoviesLoadingState ||
        current is NowPlayingMoviesFetchedState ||
        current is NowPlayingMoviesLoadingState;
  }
}
