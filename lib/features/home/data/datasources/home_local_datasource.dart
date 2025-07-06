import 'dart:convert';

import 'package:movie_app/features/home/data/models/movie_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class HomeLocalDataSource {
  Future<void> saveResultsToPrefs(MovieResponse movieResponse);

  Future<MovieResponse?> getResultsFromPrefs();
}

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  @override
  Future<MovieResponse?> getResultsFromPrefs() async {
    try {
      final sharedPreferences = await SharedPreferences.getInstance();
      final jsonString = sharedPreferences.getString('popular_movies');
      if (jsonString == null) return null;
      final Map<String, dynamic> jsonMap = jsonDecode(jsonString);
      final MovieResponse movieResponse = MovieResponse.fromJson(jsonMap);
      return movieResponse;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> saveResultsToPrefs(MovieResponse movieResponse) async {
    try {
      final sharedPreferences = await SharedPreferences.getInstance();
      final jsonString = jsonEncode(movieResponse);
      await sharedPreferences.setString('popular_movies', jsonString);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
