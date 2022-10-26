
import 'package:appfilmesgetx/models/genre_model.dart';

abstract class GenresServices {
  Future<List<GenreModel>> getGenres();
}