import 'package:appfilmesgetx/application/rest_client/rest_client.dart';
import 'package:appfilmesgetx/models/movie_model.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

import './movies_repository.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  RestClient _restClient;

  MoviesRepositoryImpl({required RestClient restClient})
      : _restClient = restClient;

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final result = await _restClient.get<List<MovieModel>>(
      '/movie/popular',
      query: {
        'api_key': FirebaseRemoteConfig.instance.getString('api_token'),
        'language': 'pt-br',
        'page':'1'
      },
      decoder: (data) {
        final results = data['result'];
        if(results != null) {
          return results.map<MovieModel>((v) => MovieModel.fromMap(v)).toList();
        }
        return <MovieModel>[];
      }
    );

    if(result.hasError) {
      print('Erro ao buscar popular movies {$result.statusText}');
      throw Exception('Erro ao buscar popular movies');
    }

    return result.body ?? <MovieModel>[];

  }

  @override
  Future<List<MovieModel>> getTopRated() async {
   final result = await _restClient.get<List<MovieModel>>(
      '/movie/top_rated',
      query: {
        'api_key': FirebaseRemoteConfig.instance.getString('api_token'),
        'language': 'pt-br',
        'page':'1'
      },
      decoder: (data) {
        final results = data['result'];
        if(results != null) {
          return results.map<MovieModel>((v) => MovieModel.fromMap(v)).toList();
        }
        return <MovieModel>[];
      }
    );

    if(result.hasError) {
      print('Erro ao buscar top rated {$result.statusText}');
      throw Exception('Erro ao buscar top rated');
    }

    return result.body ?? <MovieModel>[];
  }
}
