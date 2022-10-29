import 'package:appfilmesgetx/models/movie_detail_model.dart';
import 'package:flutter/material.dart';

class MovieDetailContentCredits extends StatelessWidget {
  final MovieDetailModel? movie;
  const MovieDetailContentCredits({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 50),
      child: Text(movie?.overview ?? ''),
    );
  }
}
