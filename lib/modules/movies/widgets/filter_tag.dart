import 'package:appfilmesgetx/application/ui/theme_extensions.dart';
import 'package:flutter/material.dart';

class FilterTag extends StatelessWidget {
  const FilterTag({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minWidth: 100, minHeight: 30),
      decoration: BoxDecoration(
        color: context.themeRed,
      ),
      child: Text('Filtro'),
    );
  }
}
