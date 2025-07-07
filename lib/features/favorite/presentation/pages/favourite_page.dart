import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:movie_app/core/common/widgets/app_bar_widget.dart';
import 'package:movie_app/core/common/widgets/scaffold_widget.dart';
import 'package:movie_app/core/constants/app_dimensions.dart';
import 'package:movie_app/core/utils/show_snackbar.dart';
import 'package:movie_app/features/favorite/presentation/bloc/favorite_bloc.dart';
import 'package:movie_app/features/home/domain/entities/results.dart';
import 'package:movie_app/features/search/presentation/widgets/loading_widget.dart';
import 'package:movie_app/features/search/presentation/widgets/movies_grid_widget.dart';
import 'package:movie_app/features/search/presentation/widgets/no_results_widget.dart';
import 'package:movie_app/main.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> with RouteAware {
  List<Results> favoriteMovies = [];

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      routeObserver.subscribe(this, ModalRoute.of(context)!);
    });
    context.read<FavoriteBloc>().add(GetAllFavoriteMoviesEvent());
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPopNext() {
    context.read<FavoriteBloc>().add(GetAllFavoriteMoviesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppBarWidget(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.size28,
        ),
        child: Column(
          children: [
            BlocConsumer<FavoriteBloc, FavoriteState>(
              listener: (context, state) {
                if (state is FavoriteAddSuccess) {
                  favoriteMovies.add(state.result);
                } else if (state is FavoriteRemoveSuccess) {
                  favoriteMovies = state.favoriteMovies;
                } else if (state is FavoriteMoviesFetchedState) {
                  favoriteMovies = state.favoriteMovies;
                } else if (state is ErrorState) {
                  showSnackBar(context, state.message);
                }
              },
              buildWhen: (previous, current) => _buildWhen(current),
              builder: (context, state) {
                if (state is FavoriteMoviesFetchedState ||
                    state is FavoriteAddSuccess ||
                    state is FavoriteRemoveSuccess ||
                    state is ErrorState) {
                  if (favoriteMovies.isEmpty) {
                    return _buildNoResultsFoundWidget(
                      context,
                      AppLocalizations.of(context)?.findAllFavoritesHere,
                    );
                  } else {
                    return MoviesGridWidget(movies: favoriteMovies);
                  }
                } else if (state is LoadingState) {
                  return const LoadingWidget();
                } else {
                  return _buildNoResultsFoundWidget(
                    context,
                    AppLocalizations.of(context)?.findAllFavoritesHere,
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  NoResultsWidget _buildNoResultsFoundWidget(
    BuildContext context,
    String? description,
  ) {
    return NoResultsWidget(
      description: description ?? "",
    );
  }

  bool _buildWhen(FavoriteState current) {
    return current is FavoriteMoviesFetchedState ||
        current is LoadingState ||
        current is ErrorState ||
        current is FavoriteAddSuccess ||
        current is FavoriteRemoveSuccess;
  }
}
