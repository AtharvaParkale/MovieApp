import 'package:dio/dio.dart';
import 'package:movie_app/core/constants/constants.dart';
import 'package:movie_app/features/home/data/models/movie_response.dart';
import 'package:retrofit/retrofit.dart';

part 'home_remote_datasource.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class HomeRemoteDataSource {
  factory HomeRemoteDataSource(Dio dio, {String baseUrl}) =
      _HomeRemoteDataSource;

  @GET(Constants.getPopularMovies)
  Future<MovieResponse> getPopularMovies();

  @GET(Constants.getNowPlayingMovies)
  Future<MovieResponse> getNowPlayingMovies();
}
