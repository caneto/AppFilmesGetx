import 'package:appfilmesgetx/application/ui/theme_extensions.dart';
import 'package:appfilmesgetx/models/movie_detail_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MovieDetailContentMainCast extends StatelessWidget {
  final MovieDetailModel? movie;
  final showPanil = false.obs;

  MovieDetailContentMainCast({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          color: context.themeGrey,
        ),
        ExpansionPanelList(
          children: [
            ExpansionPanel(
              canTapOnHeader: false,
              backgroundColor: Colors.white,
              headerBuilder: ((context, isExpanded) {
                  return const Text(
                    'Elenco',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  );
              }),
              body: Text(''))
          ],
        ),
      ],
    );
  }
}
