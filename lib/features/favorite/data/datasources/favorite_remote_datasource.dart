import 'package:dio/dio.dart';
import 'package:movie_app/core/constants/constants.dart';
import 'package:movie_app/features/favorite/data/models/movie_detail_model.dart';
import 'package:movie_app/features/home/data/models/results_model.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'favorite_remote_datasource.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class FavoriteRemoteDatasource {
  factory FavoriteRemoteDatasource(Dio dio, {String baseUrl}) =
      _FavoriteRemoteDatasource;

  @GET('/movie/{movie_id}')
  Future<MovieDetailModel> getMovieById(
    @Path("movie_id") int movieId,
  );
}
