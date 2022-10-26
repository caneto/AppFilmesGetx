import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class GenreModel {
  final int id;
  final String name;
  
  const GenreModel({
    required this.id,
    required this.name,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory GenreModel.fromMap(Map<String, dynamic> map) {
    return GenreModel(
      id: (map["id"] ?? 0) as int,
      name: (map["name"] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory GenreModel.fromJson(String source) => GenreModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'GenreModel(id: $id, name: $name)';
}
