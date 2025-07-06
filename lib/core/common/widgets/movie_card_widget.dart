import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/common/widgets/shimmer_widget.dart';
import 'package:movie_app/core/constants/app_dimensions.dart';
import 'package:movie_app/core/theme/app_pallete.dart';
import 'package:movie_app/features/home/domain/entities/results.dart';

class MovieCardWidget extends StatelessWidget {
  const MovieCardWidget({
    super.key,
    required this.movie,
    this.verticalPadding = AppDimensions.size26,
    this.borderRadius = AppDimensions.size32,
    this.disableBoxShadow = false,
  });

  final Results movie;
  final double verticalPadding;
  final double borderRadius;
  final bool disableBoxShadow;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: verticalPadding,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        border: _buildBorder(),
        boxShadow: _getBoxShadow(),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: Stack(
          children: [
            _buildMovieImage(),
            _buildGradient(),
          ],
        ),
      ),
    );
  }

  Positioned _buildGradient() {
    return Positioned.fill(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.center,
            colors: [
              Colors.black.withOpacity(0.6),
              Colors.transparent,
            ],
          ),
        ),
      ),
    );
  }

  Positioned _buildMovieImage() {
    return Positioned.fill(
      child: CachedNetworkImage(
        imageUrl: 'https://image.tmdb.org/t/p/w500${movie.posterPath}',
        fit: BoxFit.cover,
        placeholder: (context, url) => const ShimmerWidget(
          isLoading: true,
          child: Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: AppPallete.secondaryColor,
            ),
          ),
        ),
        errorWidget: (context, url, error) => Container(
          color: Colors.grey[300],
          child: const Icon(
            Icons.movie,
            size: AppDimensions.size80,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  Border _buildBorder() {
    return Border.all(
      color: const Color.fromRGBO(251, 151, 34, 0.3),
      width: 1.5,
    );
  }

  List<BoxShadow> _getBoxShadow() {
    return [
      BoxShadow(
        color: disableBoxShadow
            ? Colors.transparent
            : const Color.fromRGBO(251, 151, 34, 0.18),
        blurRadius: AppDimensions.size20,
        spreadRadius: AppDimensions.size2,
        offset: const Offset(0, -10),
      ),
      BoxShadow(
        color: disableBoxShadow
            ? Colors.transparent
            : const Color.fromRGBO(251, 151, 34, 0.08),
        blurRadius: AppDimensions.size10,
        spreadRadius: 1,
        offset: const Offset(0, -3),
      ),
    ];
  }
}
