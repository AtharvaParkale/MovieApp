import 'package:dio/dio.dart';
import 'package:movie_app/core/constants/constants.dart';
import 'package:movie_app/features/home/data/models/movie_response.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'search_page_remote_datasource.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class SearchPageRemoteDatasource {
  factory SearchPageRemoteDatasource(Dio dio, {String baseUrl}) =
      _SearchPageRemoteDatasource;

  @GET(Constants.searchMovies)
  Future<MovieResponse> searchMovies(
    @Query("query") String keyWord,
  );
}
