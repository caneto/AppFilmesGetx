import 'package:appfilmesgetx/models/genre_model.dart';
import 'package:appfilmesgetx/repositories/genres/genres_repository.dart';

import './genres_services.dart';

class GenresServicesImpl implements GenresServices {
  final GenresRepository _genresRepository;

  GenresServicesImpl({required GenresRepository genresRepository}): _genresRepository = genresRepository;

  @override
  Future<List<GenreModel>> getGenres() => _genresRepository.getGenres();

}