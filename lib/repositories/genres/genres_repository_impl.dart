import 'package:appfilmesgetx/application/rest_client/rest_client.dart';
import 'package:appfilmesgetx/models/genre_model.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';

import './genres_repository.dart';

class GenresRepositoryImpl implements GenresRepository {
  final RestClient _restClient;

  GenresRepositoryImpl({required RestClient restclient})
      : _restClient = restclient;

  @override
  Future<List<GenreModel>> getGenres() async {
    final result = await _restClient.get<List<GenreModel>>(
      '/genre/movie/list',
      query: {
        'api_key': FirebaseRemoteConfig.instance.getString('api_token'),
        'language': 'pt-br'
      },
      decoder: (data) {
        final resultData = data['genres'];
        if(resultData != null) {
          return resultData.map<GenreModel>((g) => GenreModel.fromMap(g)).toList();
        }
        return <GenreModel>[];
      }
    );

    if(result.hasError) {
      if (kDebugMode) {
        print('Erro ao buscar Genres {$result.statusText}');
      }
      throw Exception('Erro ao buscar Genres');
    }

    return result.body ?? <GenreModel>[];
  }
}
