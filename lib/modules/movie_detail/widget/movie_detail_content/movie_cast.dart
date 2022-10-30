import 'package:appfilmesgetx/application/ui/theme_extensions.dart';
import 'package:appfilmesgetx/models/cast_model.dart';
import 'package:flutter/material.dart';

class MovieCast extends StatelessWidget {
  final CastModel? cast;

  const MovieCast({Key? key, this.cast}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 95,
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if(cast?.image != 'https://image.tmdb.org/t/p/w200')  
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child:  Image.network(
                cast?.image ?? '',
                width: 85,
                fit: BoxFit.cover,
              ),
            ),
          const SizedBox(height: 8),
          Text(
            cast?.name ?? '',
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            cast?.character ?? '',
            style: TextStyle(
              fontSize: 12,
              color: context.themeGrey,
              fontWeight: FontWeight.w600,
            ),
          ),
        ]
      ),
    );
  }
}
