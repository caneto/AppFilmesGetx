import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class MovieModel {
  final int id;
  final String title;
  final String releaseDate;
  final String posterPath;
  final List<int> genres;
  final bool favorite; 
  
  const MovieModel({
    required this.id,
    required this.title,
    required this.releaseDate,
    required this.posterPath,
    required this.genres,
    required this.favorite,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'release_date': releaseDate,
      'poster_path': posterPath,
      'genre_ids': genres,
      'favorite': favorite,
    };
  }

  factory MovieModel.fromMap(Map<String, dynamic> map) {
    return MovieModel(
      id: (map["id"] ?? 0) as int,
      title: (map["title"] ?? '') as String,
      releaseDate: (map["release_date"] ?? '') as String,
      posterPath: 'https://image.tmdb.org/t/p/w200${map["poster_path"] ?? ''}',
      genres: List<int>.from(((map['genre_ids'] ?? const <int>[])),),
      favorite: (map["favorite"] ?? false) as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieModel.fromJson(String source) => MovieModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'MovieModel(id: $id, title: $title, releaseDate: $releaseDate, posterPath: $posterPath, genres: $genres, favorite: $favorite)';
  }
}
