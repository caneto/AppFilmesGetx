import 'dart:developer';

import 'package:appfilmesgetx/application/ui/messages/messages_maxin.dart';
import 'package:appfilmesgetx/models/genre_model.dart';
import 'package:appfilmesgetx/models/movie_model.dart';
import 'package:appfilmesgetx/services/genres/genres_services.dart';
import 'package:appfilmesgetx/services/movies/movies_service.dart';
import 'package:get/get.dart';

class MoviesController extends GetxController with MessagesMaxin {
  final GenresServices _genresServices;
  final MoviesService _moviesService;
  final _message = Rxn<MessagesModel>();
  final genres = <GenreModel>[].obs;
  final popularMovies = <MovieModel>[].obs;
  final topRatedMovies = <MovieModel>[].obs;

  var _popularMoviesOriginal = <MovieModel>[];
  var _topRatedMoviesOriginal = <MovieModel>[];

  MoviesController({
    required GenresServices genresServices,
    required MoviesService moviesService,
  })  : _genresServices = genresServices,
        _moviesService = moviesService;

  @override
  void onInit() {
    super.onInit();
    messagesListener(_message);
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    try {
      final genresData = await _genresServices.getGenres();
      genres.assignAll(genresData);
      
      final popularMoviesData = await _moviesService.getPopularMovies();
      final topRatedMoviesData = await _moviesService.getTopRated();

      popularMovies.assignAll(popularMoviesData);
      _popularMoviesOriginal = popularMovies;
      topRatedMovies.assignAll(topRatedMoviesData);
      _topRatedMoviesOriginal = topRatedMovies;

    } on Exception catch (e, s) {
      log('Error ao carregar dados da pagina', error: e, stackTrace: s);
      _message(MessagesModel.error(
          title: 'Erro', message: 'Error ao carregar dados da pagina'));
    }
  }

void filterByName(String title) {
    if (title.isNotEmpty) {
      var newPopularMovies = _popularMoviesOriginal.where(
        (movie) {
          return movie.title.toLowerCase().contains(
                title.toLowerCase(),
              );
        },
      );
      var newTopRatedMovies = _topRatedMoviesOriginal.where(
        (movie) {
          return movie.title.toLowerCase().contains(
                title.toLowerCase(),
              );
        },
      );
      popularMovies.assignAll(newPopularMovies);
      topRatedMovies.assignAll(newTopRatedMovies);
    } else {
      popularMovies.assignAll(_popularMoviesOriginal);
      topRatedMovies.assignAll(_topRatedMoviesOriginal);
    }
  }

}
