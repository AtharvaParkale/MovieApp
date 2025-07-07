class MovieDetail {
  final bool adult;
  final String? backdropPath;
  final int id;
  final String title;
  final String? originalTitle;
  final String overview;
  final String? releaseDate;
  final num? popularity;
  final String? posterPath;
  final num? voteAverage;
  final int? voteCount;
  final int? budget;
  final int? revenue;
  final int? runtime;
  final String? status;
  final String? tagline;

  MovieDetail({
    required this.adult,
    this.backdropPath,
    required this.id,
    required this.title,
    this.originalTitle,
    required this.overview,
    this.releaseDate,
    this.popularity,
    this.posterPath,
    this.voteAverage,
    this.voteCount,
    this.budget,
    this.revenue,
    this.runtime,
    this.status,
    this.tagline,
  });
}