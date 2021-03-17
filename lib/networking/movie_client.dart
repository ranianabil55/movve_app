import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movve_app/model/movie_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum MovieType { topRated, nowPlaying, popular, upcoming }
final databaseProvider = Provider<MovieClient>((ref) => MovieClient());

class MovieClient {
  String _convertMoveTypeToString(MovieType movieType) {
    switch (movieType) {
      case MovieType.topRated:
        return "top_rated";
      case MovieType.nowPlaying:
        return "now_playing";
      case MovieType.popular:
        return "popular";
      case MovieType.upcoming:
        return "upcoming";
    }
  }

  String _getMovieEndPoint(String typeOfMove) {
    var endpointUrl = "https://api.themoviedb.org/3/movie/$typeOfMove";
    Map<String, String> queryParams = {
      'api_key': 'a1be7d3c3df5ffc68e5dc294b9b84e82',
      'language': 'en-US',
      'page': '1',
    };

    String queryString = Uri(queryParameters: queryParams).query;

    return endpointUrl + '?' + queryString;
  }

  Future<List<Movie>> getMovies(MovieType movieType) async {
    String typeOfMove = _convertMoveTypeToString(movieType);
    var endpointUrl = _getMovieEndPoint(typeOfMove);

    final response = await http.get(endpointUrl);

    if (response.statusCode == 200) {
      Map json = jsonDecode(response.body);

      List<Movie> results = (json['results'] as List)
          .map((movieJson) => Movie.fromJson(movieJson))
          .toList();

      return results;
    } else
      throw Exception('Error');
  }
}
