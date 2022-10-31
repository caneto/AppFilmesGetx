import 'package:appfilmesgetx/application/auth/auth_service.dart';
import 'package:appfilmesgetx/models/movie_model.dart';
import 'package:appfilmesgetx/services/movies/movies_service.dart';
import 'package:get/get.dart';

class FavoritesController extends GetxController {
  final MoviesService _moviesService;
  final AuthService _authService;

  var movies = <MovieModel>[].obs;

  FavoritesController(
      {required MoviesService moviesService, required AuthService authService})
      : _moviesService = moviesService,
        _authService = authService;

  @override
  Future<void> onReady() async {
    super.onReady();
    var user = _authService.user;
    if(user!=null) {
      var favorites = await _moviesService.getFavoritiesMovies(user.uid);
      movies.assignAll(favorites);
    }
  }      

   Future<void> removeFavorite({required MovieModel movie}) async {
    var user = _authService.user;
    if (user != null) {
      await _moviesService.addOrRemoveFavorite(
        user.uid,
        movie.copyWith(favorite: false),
      );
      movies.remove(movie);
    }
  }
}
