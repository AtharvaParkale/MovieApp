import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/app_dimensions.dart';
import 'package:movie_app/features/home/domain/entities/results.dart';

class HeroBannerWidget extends StatelessWidget {
  const HeroBannerWidget({super.key, required this.movie});

  final Results movie;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.55,
      width: double.infinity,
      child: Hero(
        tag: 'movie_${movie.id}',
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: _buildNetWorkImage(),
        ),
      ),
    );
  }

  Image _buildNetWorkImage() {
    return Image.network(
      'https://image.tmdb.org/t/p/w500${movie.posterPath ?? movie.backdropPath ?? ''}',
      fit: BoxFit.cover,
      errorBuilder: (_, __, ___) => Container(
        color: Colors.grey[300],
        child: const Icon(
          Icons.movie,
          size: AppDimensions.size80,
          color: Colors.grey,
        ),
      ),
    );
  }
}
