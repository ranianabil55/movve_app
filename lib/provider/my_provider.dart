import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movve_app/model/movie_model.dart';
import 'package:movve_app/networking/movie_client.dart';

final popularProvider = FutureProvider<List<Movie>>((ref) async {
  return ref.read(databaseProvider).getMovies(MovieType.popular);
});
final topRatedProvider = FutureProvider<List<Movie>>((ref) async {
  return ref.read(databaseProvider).getMovies(MovieType.topRated);
});
final upComingProvider = FutureProvider<List<Movie>>((ref) async {
  return ref.read(databaseProvider).getMovies(MovieType.upcoming);
});
final nowPlayingProvider = FutureProvider<List<Movie>>((ref) async {
  return ref.read(databaseProvider).getMovies(MovieType.nowPlaying);
});
