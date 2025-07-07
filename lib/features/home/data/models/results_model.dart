import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/features/home/domain/entities/results.dart';

part 'results_model.g.dart';

@JsonSerializable()
class ResultsModel {
  final bool? adult;
  @JsonKey(name: 'backdrop_path')
  final String? backdropPath;
  @JsonKey(name: 'genre_ids', defaultValue: [])
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
  final num? voteAverage;
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

  Results toEntity() => Results(
    adult: adult ?? false,
    backdropPath: backdropPath,
    genreIds: genreIds ?? [],
    id: id ?? 0,
    originalLanguage: originalLanguage ?? '',
    originalTitle: originalTitle ?? '',
    overview: overview ?? '',
    popularity: popularity ?? 0.0,
    posterPath: posterPath,
    releaseDate: releaseDate ?? '',
    title: title ?? '',
    video: video ?? false,
    voteAverage: voteAverage ?? 0.0,
    voteCount: voteCount ?? 0,
  );

  factory ResultsModel.fromEntity(Results entity) => ResultsModel(
    adult: entity.adult,
    backdropPath: entity.backdropPath,
    genreIds: entity.genreIds,
    id: entity.id,
    originalLanguage: entity.originalLanguage,
    originalTitle: entity.originalTitle,
    overview: entity.overview,
    popularity: entity.popularity,
    posterPath: entity.posterPath,
    releaseDate: entity.releaseDate,
    title: entity.title,
    video: entity.video,
    voteAverage: entity.voteAverage,
    voteCount: entity.voteCount,
  );
}
