import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class CastModel {
  final String name;
  final String image;
  final String character;
  
  const CastModel({
    required this.name,
    required this.image,
    required this.character,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'image': image,
      'character': character,
    };
  }

  factory CastModel.fromMap(Map<String, dynamic> map) {
    return CastModel(
      name: (map["original_name"] ?? '') as String,
      image: 'https://image.tmdb.org/t/p/w200${map["profile_path"] ?? ''}',
      character: (map["character"] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CastModel.fromJson(String source) => CastModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CastModel(name: $name, image: $image, character: $character)';
}
