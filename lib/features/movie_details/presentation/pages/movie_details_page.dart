import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/common/widgets/scaffold_widget.dart';
import 'package:movie_app/features/home/domain/entities/results.dart';
import 'package:movie_app/features/movie_details/presentation/bloc/movie_details_bloc.dart';
import 'package:movie_app/features/movie_details/presentation/widget/draggable_sheet_widget.dart';
import 'package:movie_app/features/movie_details/presentation/widget/hero_banner_widget.dart';
import 'package:movie_app/features/movie_details/presentation/widget/image_gradient_widget.dart';

class MovieDetailsPage extends StatefulWidget {
  static route(movie) => MaterialPageRoute(
        builder: (context) => MovieDetailsPage(
          movie: movie,
        ),
      );

  const MovieDetailsPage({super.key, required this.movie});

  final Results movie;

  @override
  State<MovieDetailsPage> createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  @override
  void initState() {
    super.initState();
    context.read<MovieDetailsBloc>().add(GetFavouriteMovieIdsEvent());
  }

  List<int> movieIds = [];

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      body: Stack(
        children: [
          HeroBannerWidget(movie: widget.movie),
          const ImageGradientWidget(),
          BlocConsumer<MovieDetailsBloc, MovieDetailsState>(
            listener: (context, state) {
              if (state is FavoriteAddSuccess) {
                movieIds = state.movieIds;
              } else if (state is FavoriteRemoveSuccess) {
                movieIds = state.movieIds;
              } else if (state is GetAllFavoriteMovies) {
                movieIds = state.movieIds;
              }
            },
            buildWhen: (previous, current) => _buildWhen(current),
            builder: (context, state) {
              return DraggableSheetWidget(
                movie: widget.movie,
                movieIds: movieIds,
              );
            },
          )
        ],
      ),
    );
  }

  bool _buildWhen(MovieDetailsState current) {
    return current is GetAllFavoriteMovies ||
        current is FavoriteRemoveSuccess ||
        current is FavoriteAddSuccess;
  }
}
