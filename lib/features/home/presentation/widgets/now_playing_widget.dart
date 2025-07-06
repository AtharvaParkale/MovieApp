import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:movie_app/core/common/widgets/title_chip_widget.dart';
import 'package:movie_app/core/constants/app_dimensions.dart';
import 'package:movie_app/features/home/domain/entities/results.dart';
import 'package:movie_app/features/home/presentation/widgets/now_playing_movies_carousel.dart';

class NowPlayingWidget extends StatelessWidget {
  const NowPlayingWidget({super.key, required this.movies});

  final List<Results> movies;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleChipWidget(
            title: AppLocalizations.of(context)?.nowPlaying ?? "",
          ),
          const SizedBox(height: AppDimensions.size10),
          Padding(
            padding: const EdgeInsets.only(left: AppDimensions.size34),
            child: NowPlayingMoviesCarousel(movies: movies),
          ),
          const SizedBox(height: AppDimensions.size40),
        ],
      ),
    );
  }
}
