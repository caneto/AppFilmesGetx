import 'package:appfilmesgetx/modules/movies/widgets/filter_tag.dart';
import 'package:flutter/material.dart';

class MoviesFilters extends StatelessWidget {

  const MoviesFilters({ Key? key }) : super(key: key);

   @override
   Widget build(BuildContext context) {
       return Row(
         children: const [
           FilterTag(),
         ],
       );
  }
}