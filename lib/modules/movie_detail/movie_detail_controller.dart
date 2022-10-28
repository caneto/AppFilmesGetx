import 'dart:developer';

import 'package:appfilmesgetx/application/ui/loader/loader_mixin.dart';
import 'package:appfilmesgetx/application/ui/messages/messages_maxin.dart';
import 'package:appfilmesgetx/models/movie_detail_model.dart';
import 'package:appfilmesgetx/services/movies/movies_service.dart';
import 'package:get/get.dart';

class MovieDetailController extends GetxController with LoaderMixin, MessagesMaxin {

  final MoviesService _moviesService;

  var loading = false.obs;
  var message = Rxn<MessagesModel>();
  var movie = Rxn<MovieDetailModel>();

  MovieDetailController({required MoviesService moviesService}) : _moviesService = moviesService;

  @override
  void onInit() {
    super.onInit();

    LoaderListener(loading);
    messagesListener(message);
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    try {
      final movieId = Get.arguments;
      loading(true);
      final movieDetailData = await _moviesService.getDetail(movieId);
      movie.value = movieDetailData;
      loading(false);
    } catch (e, s) {
      log('Erro ao Buscar Detalhes do Filme', error: e, stackTrace: s);
      loading(false);
      message(MessagesModel.error(title: 'Erro', message: 'Erro ao Buscar Detalhe do Filme'));
    }
  }

}