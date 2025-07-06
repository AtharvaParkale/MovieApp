import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:movie_app/core/common/widgets/title_chip_widget.dart';
import 'package:movie_app/core/constants/app_dimensions.dart';
import 'package:movie_app/features/home/domain/entities/results.dart';
import 'package:movie_app/features/home/presentation/widgets/popular_movies_carousel_widget.dart';

class TrendingNowWidget extends StatelessWidget {
  const TrendingNowWidget({
    super.key,
    required this.movies,
    required this.isLoading,
  });

  final List<Results> movies;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleChipWidget(
            title: AppLocalizations.of(context)?.trendingMovies ?? "",
          ),
          const SizedBox(height: AppDimensions.size10),
          PopularMoviesCarouselWidget(
            movies: movies,
            isLoading: isLoading,
          ),
        ],
      ),
    );
  }
}
