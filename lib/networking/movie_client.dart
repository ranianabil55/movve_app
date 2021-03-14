import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movve_app/model/top_rated.dart';

class MovieClient {
  Future<MovieTopRated> getMovie(String url) async {
    //final String url = kTopRated;
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return MovieTopRated.fromJson(json);
    } else
      throw Exception('Error');
  }
}
