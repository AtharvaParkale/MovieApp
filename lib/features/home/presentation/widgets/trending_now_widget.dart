import 'package:flutter/material.dart';
import 'package:movie_app/core/common/widgets/title_chip_widget.dart';
import 'package:movie_app/core/constants/app_dimensions.dart';
import 'package:movie_app/features/home/domain/entities/results.dart';
import 'package:movie_app/features/home/presentation/widgets/popular_movies_carousel_widget.dart';

class TrendingNowWidget extends StatelessWidget {
  const TrendingNowWidget({super.key, required this.movies});

  final List<Results> movies;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TitleChipWidget(),
          const SizedBox(height: AppDimensions.size10),
          PopularMoviesCarouselWidget(movies: movies),
        ],
      ),
    );
  }
}
