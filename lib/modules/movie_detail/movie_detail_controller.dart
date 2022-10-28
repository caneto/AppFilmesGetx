import 'package:appfilmesgetx/application/ui/loader/loader_mixin.dart';
import 'package:appfilmesgetx/application/ui/messages/messages_maxin.dart';
import 'package:appfilmesgetx/services/movies/movies_service.dart';
import 'package:get/get.dart';

class MovieDetailController extends GetxController with LoaderMixin, MessagesMaxin {

  final MoviesService _moviesService;

  var loading = false.obs;
  var message = Rxn<MessagesModel>();

  MovieDetailController({required MoviesService moviesService}) : _moviesService = moviesService;

  @override
  void onInit() {
    super.onInit();

    LoaderListener(loading);
    messagesListener(message);
  }

  @override
  void onReady() {
    super.onReady();
    final movieId = Get.arguments;
  }

}