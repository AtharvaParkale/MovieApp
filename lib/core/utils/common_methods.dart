import 'package:movie_app/core/constants/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CommonMethods {
  final Map<int, String> genreMap = {
    28: 'Action',
    12: 'Adventure',
    16: 'Animation',
    35: 'Comedy',
    80: 'Crime',
    99: 'Documentary',
    18: 'Drama',
    10751: 'Family',
    14: 'Fantasy',
    36: 'History',
    27: 'Horror',
    10402: 'Music',
    9648: 'Mystery',
    10749: 'Romance',
    878: 'Science Fiction',
    10770: 'TV Movie',
    53: 'Thriller',
    10752: 'War',
    37: 'Western',
  };

  String formatPopularity(num? popularity) {
    if (popularity == null || popularity == 0) return "0.0";

    final digitsOnly = popularity.toString().replaceAll('.', '');

    if (digitsOnly.length == 1) {
      return "${digitsOnly[0]}.0";
    }

    return "${digitsOnly[0]}.${digitsOnly[1]}";
  }

  Future<List<int>> addMovieIdToFavorites(int movieId) async {
    final prefs = await SharedPreferences.getInstance();
    final favList = prefs.getStringList(Constants.favoriteMovies) ?? [];

    if (!favList.contains(movieId.toString())) {
      favList.add(movieId.toString());
      await prefs.setStringList(Constants.favoriteMovies, favList);
    }

    return favList.map(int.parse).toList();
  }

  Future<List<int>> removeMovieIdFromFavorites(int movieId) async {
    final prefs = await SharedPreferences.getInstance();
    final favList = prefs.getStringList(Constants.favoriteMovies) ?? [];

    if (favList.contains(movieId.toString())) {
      favList.remove(movieId.toString());
      await prefs.setStringList(Constants.favoriteMovies, favList);
    }

    return favList.map(int.parse).toList();
  }

  Future<List<int>> getFavoriteMovieIds() async {
    final prefs = await SharedPreferences.getInstance();
    final favList = prefs.getStringList(Constants.favoriteMovies) ?? [];
    return favList.map(int.parse).toList();
  }
}
