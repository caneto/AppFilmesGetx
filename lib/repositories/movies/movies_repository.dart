import 'package:appfilmesgetx/models/movie_detail_model.dart';
import 'package:appfilmesgetx/models/movie_model.dart';

abstract class MoviesRepository {
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRated();
  Future<MovieDetailModel?> getDetail(int id);
}