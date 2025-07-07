import 'package:flutter/material.dart';
import 'package:movie_app/features/home/domain/entities/results.dart';

class HeroBannerWidget extends StatelessWidget {
  const HeroBannerWidget({super.key, required this.movie});

  final Results movie;

  @override
  Widget build(BuildContext context) {
    final path = movie.posterPath ?? movie.backdropPath ?? '';

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.55,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          _buildHeroBanner(path),
          _buildBackButton(context),
        ],
      ),
    );
  }

  Positioned _buildBackButton(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).padding.top + 8,
      left: 12,
      child: GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.5),
            shape: BoxShape.circle,
          ),
          padding: const EdgeInsets.all(8),
          child: const Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
    );
  }

  Hero _buildHeroBanner(String path) {
    return Hero(
      tag: 'movie_${movie.id}',
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(24),
        ),
        child: Image.network(
          'https://image.tmdb.org/t/p/w500$path',
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => Container(
            color: Colors.grey[800],
            child: const Icon(Icons.broken_image, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
