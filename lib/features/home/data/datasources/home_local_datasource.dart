import 'dart:convert';

import 'package:movie_app/core/constants/app_enums.dart';
import 'package:movie_app/features/home/data/models/movie_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class HomeLocalDataSource {
  Future<MovieResponse?> getResultsFromPrefs(ApiTag apiTag);

  Future<void> saveResultsToPrefs(MovieResponse movieResponse, ApiTag apiTag);
}

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  @override
  Future<MovieResponse?> getResultsFromPrefs(ApiTag apiTag) async {
    try {
      final sharedPreferences = await SharedPreferences.getInstance();
      final jsonString = sharedPreferences.getString(apiTag.name);
      if (jsonString == null) return null;
      final Map<String, dynamic> jsonMap = jsonDecode(jsonString);
      final MovieResponse movieResponse = MovieResponse.fromJson(jsonMap);
      return movieResponse;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> saveResultsToPrefs(
    MovieResponse movieResponse,
    ApiTag apiTag,
  ) async {
    try {
      final sharedPreferences = await SharedPreferences.getInstance();
      final jsonString = jsonEncode(movieResponse);
      await sharedPreferences.setString(apiTag.name, jsonString);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
