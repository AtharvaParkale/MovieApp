import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/common/widgets/shimmer_widget.dart';
import 'package:movie_app/core/constants/app_dimensions.dart';
import 'package:movie_app/core/constants/app_font_weigth.dart';
import 'package:movie_app/core/theme/app_text_theme.dart';
import 'package:movie_app/features/home/domain/entities/results.dart';
import 'package:movie_app/features/movie_details/presentation/pages/movie_details_page.dart';

class PopularMoviesCarouselWidget extends StatefulWidget {
  const PopularMoviesCarouselWidget({
    super.key,
    required this.movies,
    required this.isLoading,
  });

  final List<Results> movies;
  final bool isLoading;

  @override
  State<PopularMoviesCarouselWidget> createState() =>
      _PopularMoviesCarouselWidgetState();
}

class _PopularMoviesCarouselWidgetState
    extends State<PopularMoviesCarouselWidget> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: MediaQuery.of(context).size.height * 0.65,
        enlargeCenterPage: true,
        viewportFraction: 0.75,
        enableInfiniteScroll: true,
        autoPlay: !(widget.isLoading),
      ),
      items: widget.movies.map((movie) {
        return Builder(
          builder: (context) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: _buildCard(movie)),
                _buildTitle(movie),
                const SizedBox(height: AppDimensions.size6),
                _buildRatings(movie),
              ],
            );
          },
        );
      }).toList(),
    );
  }

  Widget _buildRatings(Results movie) {
    if (widget.isLoading) return const Text("");
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

  Widget _buildTitle(Results movie) {
    if (widget.isLoading) return const Text("");
    return Text(
      movie.title ?? "",
      style: appTextTheme.titleMedium?.copyWith(
        fontWeight: AppFontWeight.extraBold,
        color: const Color.fromRGBO(255, 255, 255, 0.83),
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildCard(Results movie) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MovieDetailsPage(
              movie: movie,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: AppDimensions.size14,
        ),
        child: ShimmerWidget(
          isLoading: widget.isLoading,
          child: Container(
            margin: const EdgeInsets.symmetric(
              vertical: AppDimensions.size12,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppDimensions.size30),
              border: Border.all(
                color: const Color.fromRGBO(251, 151, 34, 0.3),
                width: 1.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: widget.isLoading
                      ? Colors.transparent
                      : const Color.fromRGBO(251, 151, 34, 0.18),
                  blurRadius: AppDimensions.size20,
                  spreadRadius: AppDimensions.size2,
                  offset: const Offset(0, -10),
                ),
                BoxShadow(
                  color: widget.isLoading
                      ? Colors.transparent
                      : const Color.fromRGBO(251, 151, 34, 0.08),
                  blurRadius: AppDimensions.size10,
                  spreadRadius: 1,
                  offset: const Offset(0, -3),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppDimensions.size30),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Image.network(
                      'https://image.tmdb.org/t/p/w500${movie.posterPath}',
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
        ),
      ),
    );
  }
}
