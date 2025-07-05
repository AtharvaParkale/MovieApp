import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/common/widgets/app_bar_widget.dart';
import 'package:movie_app/core/common/widgets/scaffold_widget.dart';
import 'package:movie_app/core/constants/app_dimensions.dart';
import 'package:movie_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:movie_app/features/home/presentation/widgets/trending_now_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(GetPopularMoviesEvent());
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
            print('Demo :: ${state.popularMovies.results.length}');
          }
        },
        builder: (context, state) {
          return const Column(
            children: [
              SizedBox(height: AppDimensions.size15),
              TrendingNowWidget(),
            ],
          );
        },
      ),
    );
  }
}
