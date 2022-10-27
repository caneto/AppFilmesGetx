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

  final _popularMovies = <MovieModel>[];
  final _topRatedMovies = <MovieModel>[];

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
      final genres = await _genresServices.getGenres();
      this.genres.assignAll(genres);
    } on Exception catch (e) {
      _message(MessagesModel.error(
          title: 'Erro', message: 'Error ao buscar Generos'));
    }
  }
}
