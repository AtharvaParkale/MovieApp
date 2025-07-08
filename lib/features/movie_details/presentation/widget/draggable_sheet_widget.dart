import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/common/widgets/expandable_description.dart';
import 'package:movie_app/core/constants/app_dimensions.dart';
import 'package:movie_app/core/constants/app_font_weigth.dart';
import 'package:movie_app/core/theme/app_pallete.dart';
import 'package:movie_app/core/theme/app_text_theme.dart';
import 'package:movie_app/core/utils/common_methods.dart';
import 'package:movie_app/features/home/domain/entities/results.dart';
import 'package:movie_app/features/movie_details/presentation/bloc/movie_details_bloc.dart';
import 'package:share_plus/share_plus.dart';

class DraggableSheetWidget extends StatelessWidget {
  const DraggableSheetWidget({
    super.key,
    required this.movie,
    required this.movieIds,
  });

  final Results movie;
  final List<int> movieIds;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.50,
      minChildSize: 0.50,
      maxChildSize: 0.6,
      builder: (context, scrollController) {
        return Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 34,
            vertical: 24,
          ),
          decoration: BoxDecoration(
            color: AppPallete.primaryColor,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(34)),
            boxShadow: [
              BoxShadow(
                color: AppPallete.secondaryColor.withOpacity(0.3),
                spreadRadius: 5,
                blurRadius: 10,
                offset: const Offset(0, -4), // Shadow appears above the sheet
              ),
            ],
          ),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildNudge(),
                _buildRatingsSection(),
                const SizedBox(height: 14),
                _buildTitle(),
                const SizedBox(height: 10),
                _buildGenreSection(),
                const SizedBox(height: 26),
                ExpandableDescription(text: movie.overview ?? ""),
                const SizedBox(height: 26),
                _buildActionIconsRow(context),
                const SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildActionIconsRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildFavoriteWidget(context),
        GestureDetector(
          onTap: () {
            final String deepLink = "movieapp://details/${movie.id}";
            SharePlus.instance.share(
                ShareParams(text: 'Check out this movie: $deepLink')
            );
          },
          child: _buildIconWithLabel(
            Icons.share,
            'Share',
            Colors.white,
          ),
        ),
      ],
    );
  }

  GestureDetector _buildFavoriteWidget(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (movieIds.contains(movie.id)) {
          context
              .read<MovieDetailsBloc>()
              .add(RemoveFavoriteMovieEvent(movieId: movie.id ?? 0));
        } else {
          context
              .read<MovieDetailsBloc>()
              .add(AddFavoriteMovieEvent(movieId: movie.id ?? 0));
        }
      },
      child: _buildIconWithLabel(
        movieIds.contains(movie.id) ? Icons.favorite : Icons.favorite_border,
        'Favorite',
        movieIds.contains(movie.id) ? AppPallete.secondaryColor : Colors.white,
      ),
    );
  }

  Widget _buildIconWithLabel(IconData icon, String label, Color color) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: color,
          size: 28,
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: appTextTheme.bodyLarge?.copyWith(
            fontWeight: AppFontWeight.medium,
            color: Colors.white70,
            height: 1.2,
            fontSize: 11,
          ),
        ),
      ],
    );
  }

  Widget _buildGenreSection() {
    final genreNames = movie.genreIds
        ?.map((id) => CommonMethods().genreMap[id] ?? 'Unknown')
        .toList();

    return Wrap(
      spacing: 8,
      runSpacing: 4,
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: List.generate(genreNames!.length, (index) {
        final isLast = index == genreNames.length - 1;
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              genreNames[index],
              style: appTextTheme.bodyLarge?.copyWith(
                fontWeight: AppFontWeight.medium,
                color: Colors.white,
                height: 1.2,
                fontSize: 11,
              ),
            ),
            const SizedBox(width: 4),
            if (!isLast)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Container(
                  width: 4,
                  height: 4,
                  decoration: const BoxDecoration(
                    color: AppPallete.secondaryColor,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
          ],
        );
      }),
    );
  }

  Widget _buildRatingsSection() {
    return Row(
      children: [
        _buildImdbChip(),
        const SizedBox(width: 10),
        _buildRatingStars(),
        const SizedBox(width: 10),
        _buildReviewsTab(),
      ],
    );
  }

  Container _buildImdbChip() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(50), // Capsule shape
      ),
      child: Row(
        children: [
          Text(
            "IMDB ",
            style: appTextTheme.bodyLarge?.copyWith(
              fontWeight: AppFontWeight.bold,
              color: Colors.black,
              height: 1.2,
              fontSize: 11,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(width: 3),
          Text(
            movie.popularity != null
                ? (movie.popularity != null
                    ? CommonMethods().formatPopularity(movie.popularity)
                    : 'N/A')
                : "N/A",
            style: appTextTheme.bodyLarge?.copyWith(
              fontWeight: AppFontWeight.bold,
              color: Colors.black,
              height: 1.2,
              fontSize: 11,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Text _buildDescription() {
    return Text(
      movie.overview ?? 'No description available.',
      style: appTextTheme.labelSmall?.copyWith(
        fontWeight: AppFontWeight.medium,
        color: Colors.white70,
        height: 1.7,
        fontSize: AppDimensions.size14,
      ),
    );
  }

  Text _buildTitle() {
    return Text(
      movie.title ?? '',
      style: appTextTheme.labelSmall?.copyWith(
        fontWeight: AppFontWeight.bold,
        color: Colors.white,
        fontSize: AppDimensions.size30,
      ),
    );
  }

  Center _buildNudge() {
    return Center(
      child: Container(
        width: 40,
        height: 5,
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: Colors.grey[700],
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  Widget _buildRatingStars() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(
          Icons.star,
          color: Colors.amber,
          size: AppDimensions.size14,
        ),
        const SizedBox(width: AppDimensions.size4),
        Text(
          (movie.voteAverage?.toStringAsFixed(1)).toString() ?? "",
          style: appTextTheme.labelSmall?.copyWith(
            fontWeight: AppFontWeight.bold,
            color: Colors.amber,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildReviewsTab() {
    return Text(
      "(${movie.voteCount} reviews)" ?? "",
      style: appTextTheme.labelSmall?.copyWith(
        fontWeight: AppFontWeight.medium,
        color: Colors.white,
        fontSize: AppDimensions.size12,
      ),
      textAlign: TextAlign.center,
    );
  }
}
