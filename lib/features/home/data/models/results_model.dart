import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/features/home/domain/entities/results.dart';

part 'results_model.g.dart';

@JsonSerializable()
class ResultsModel {
  final bool? adult;
  @JsonKey(name: 'backdrop_path')
  final String? backdropPath;
  @JsonKey(name: 'genre_ids')
  final List<int>? genreIds;
  final int? id;
  @JsonKey(name: 'original_language')
  final String? originalLanguage;
  @JsonKey(name: 'original_title')
  final String? originalTitle;
  final String? overview;
  final double? popularity;
  @JsonKey(name: 'poster_path')
  final String? posterPath;
  @JsonKey(name: 'release_date')
  final String? releaseDate;
  final String? title;
  final bool? video;
  @JsonKey(name: 'vote_average')
  final double? voteAverage;
  @JsonKey(name: 'vote_count')
  final int? voteCount;

  ResultsModel({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  factory ResultsModel.fromJson(Map<String, dynamic> json) =>
      _$ResultsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResultsModelToJson(this);

  /// ✅ Convert to domain entity
  Results toEntity() => Results(
        id: id ?? 0,
        title: title ?? '',
        posterPath: posterPath,
      );

  /// 🔁 Optional: Convert from domain entity (useful for local DB)
  factory ResultsModel.fromEntity(Results entity) => ResultsModel(
        id: entity.id,
        title: entity.title,
        posterPath: entity.posterPath,
      );
}
