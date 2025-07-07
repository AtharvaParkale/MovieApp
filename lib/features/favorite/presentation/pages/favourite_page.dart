import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/common/widgets/scaffold_widget.dart';
import 'package:movie_app/core/utils/show_snackbar.dart';
import 'package:movie_app/features/favorite/presentation/bloc/favorite_bloc.dart';
import 'package:movie_app/features/home/domain/entities/results.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  List<Results> favoriteMovies = [];

  @override
  void initState() {
    super.initState();
    context.read<FavoriteBloc>().add(GetAllFavoriteMoviesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      body: Column(
        children: [
          const SizedBox(height: 20),
          const Text(
            'Favourite Page',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
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
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...favoriteMovies.map((movie) {
                    return Text(
                      movie.title ?? 'No Title',
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    );
                  }).toList(),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          context
                              .read<FavoriteBloc>()
                              .add(AddFavoriteMovieEvent(1234821));
                        },
                        icon: const Icon(Icons.favorite),
                        label: const Text("Add Favorite"),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          if (favoriteMovies.isNotEmpty) {
                            final movieToRemove = favoriteMovies.first;
                            context
                                .read<FavoriteBloc>()
                                .add(RemoveFavoriteMovieEvent(541671));
                          }
                        },
                        icon: const Icon(Icons.delete),
                        label: const Text("Remove Favorite"),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ],
      ),
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
