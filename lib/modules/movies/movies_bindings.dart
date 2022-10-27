import 'package:appfilmesgetx/repositories/genres/genres_repository.dart';
import 'package:appfilmesgetx/repositories/genres/genres_repository_impl.dart';
import 'package:appfilmesgetx/services/genres/genres_services.dart';
import 'package:appfilmesgetx/services/genres/genres_services_impl.dart';
import 'package:get/get.dart';

import 'movies_controller.dart';

class MoviesBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GenresRepository>(() => GenresRepositoryImpl(restclient: Get.find()));
    Get.lazyPut<GenresServices>(() => GenresServicesImpl(genresRepository: Get.find()));
    Get.lazyPut(() => MoviesController(genresServices: Get.find(), moviesService: Get.find()));
  }
}