import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/app_dimensions.dart';
import 'package:movie_app/core/constants/app_font_weigth.dart';
import 'package:movie_app/core/theme/app_text_theme.dart';
import 'package:movie_app/features/home/domain/entities/results.dart';

class NowPlayingMoviesCarousel extends StatefulWidget {
  const NowPlayingMoviesCarousel({super.key, required this.movies});

  final List<Results> movies;

  @override
  State<NowPlayingMoviesCarousel> createState() =>
      _NowPlayingMoviesCarouselState();
}

class _NowPlayingMoviesCarouselState extends State<NowPlayingMoviesCarousel> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: MediaQuery.of(context).size.height * 0.27,
        viewportFraction: 0.73,
        enlargeCenterPage: false,
        scrollDirection: Axis.horizontal,
        initialPage: 0,
        padEnds: false,
      ),
      items: widget.movies.map((movie) {
        return Builder(
          builder: (context) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: _buildCard(movie)),
                _buildTitle(movie),
                const SizedBox(height: AppDimensions.size6),
              ],
            );
          },
        );
      }).toList(),
    );
  }

  Widget _buildTitle(Results movie) {
    return Padding(
      padding: const EdgeInsets.only(right: AppDimensions.size40),
      child: Text(
        movie.title ?? "",
        style: appTextTheme.titleMedium?.copyWith(
          fontWeight: AppFontWeight.semiBold,
          color: const Color.fromRGBO(255, 255, 255, 0.83),
          fontSize: AppDimensions.size16,
        ),
        textAlign: TextAlign.start,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _buildCard(Results movie) {
    return Padding(
      padding: const EdgeInsets.only(
        top: AppDimensions.size14,
      ),
      child: Container(
        margin: const EdgeInsets.only(
          top: AppDimensions.size12,
          bottom: AppDimensions.size12,
          right: AppDimensions.size14,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppDimensions.size18),
          border: Border.all(
            color: const Color.fromRGBO(251, 151, 34, 0.3),
            width: 1.5,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(AppDimensions.size18),
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.network(
                  'https://image.tmdb.org/t/p/w500${movie.backdropPath}',
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    color: Colors.grey[300],
                    child: const Icon(
                      Icons.movie,
                      size: AppDimensions.size80,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              Positioned.fill(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
