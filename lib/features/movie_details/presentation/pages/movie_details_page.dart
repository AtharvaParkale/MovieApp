import 'package:flutter/material.dart';
import 'package:movie_app/core/common/widgets/scaffold_widget.dart';
import 'package:movie_app/features/home/domain/entities/results.dart';
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
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      body: Stack(
        children: [
          HeroBannerWidget(movie: widget.movie),
          const ImageGradientWidget(),
          DraggableSheetWidget(movie: widget.movie)
        ],
      ),
    );
  }
}
