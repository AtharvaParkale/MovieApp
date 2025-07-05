import 'package:movie_app/features/home/domain/entities/results.dart';

class Movie {
  int page;
  List<Results> results;
  int totalPages;
  int totalResults;

  Movie({
    required this.page,
    this.results = const [],
    required this.totalPages,
    required this.totalResults,
  });
}
