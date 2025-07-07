import 'package:flutter/material.dart';
import 'package:movie_app/core/common/widgets/movie_card_widget.dart';
import 'package:movie_app/core/constants/app_dimensions.dart';
import 'package:movie_app/features/home/domain/entities/results.dart';
import 'package:movie_app/features/movie_details/presentation/pages/movie_details_page.dart';

class MoviesGridWidget extends StatelessWidget {
  const MoviesGridWidget({super.key, required this.movies});

  final List<Results> movies;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: AppDimensions.size18),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12.0,
            crossAxisSpacing: 12.0,
            childAspectRatio: 0.66,
          ),
          padding: const EdgeInsets.all(0.0), // padding around the grid
          itemCount: movies.length, // total number of items
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MovieDetailsPage(
                      movie: movies[index],
                    ),
                  ),
                );
              },
              child: MovieCardWidget(
                movie: movies[index],
                verticalPadding: 0.0,
                borderRadius: AppDimensions.size16,
                disableBoxShadow: true,
              ),
            );
          },
        ),
      ),
    );
  }
}
