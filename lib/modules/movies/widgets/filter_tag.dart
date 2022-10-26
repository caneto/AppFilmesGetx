import 'package:appfilmesgetx/application/ui/theme_extensions.dart';
import 'package:appfilmesgetx/models/genre_model.dart';
import 'package:flutter/material.dart';

class FilterTag extends StatelessWidget {
  final GenreModel genreModel;
  final bool selected;
  final VoidCallback onPressed;

  const FilterTag({
    Key? key,
    required this.genreModel,
    this.selected = false,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(6),
        margin: const EdgeInsets.all(5),
        constraints: const BoxConstraints(minWidth: 100, minHeight: 30),
        decoration: BoxDecoration(
          color: selected ? context.themeRed : Colors.black,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            genreModel.name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}
