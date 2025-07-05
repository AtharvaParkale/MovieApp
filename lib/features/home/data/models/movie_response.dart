import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/features/home/data/models/results_model.dart';
import 'package:movie_app/features/home/domain/entities/movie.dart';

part 'movie_response.g.dart';

@JsonSerializable()
class MovieResponse {
  final int page;
  final List<ResultsModel> results;
  @JsonKey(name: 'total_pages')
  final int totalPages;
  @JsonKey(name: 'total_results')
  final int totalResults;

  MovieResponse({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory MovieResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MovieResponseToJson(this);

  Movie toEntity() => Movie(
        page: page,
        results: results.map((e) => e.toEntity()).toList(),
        totalPages: totalPages,
        totalResults: totalResults,
      );

  factory MovieResponse.fromEntity(Movie entity) => MovieResponse(
        page: entity.page,
        results: entity.results
            .map((result) => ResultsModel.fromEntity(result))
            .toList(),
        totalPages: entity.totalPages,
        totalResults: entity.totalResults,
      );
}
