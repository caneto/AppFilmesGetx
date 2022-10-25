import 'package:appfilmesgetx/application/ui/filmes_app_icons_icons.dart';
import 'package:appfilmesgetx/application/ui/theme_extensions.dart';
import 'package:appfilmesgetx/modules/favorites/favorites_page.dart';
import 'package:appfilmesgetx/modules/movies/movies_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {

  const HomePage({ Key? key }) : super(key: key);

   @override
   Widget build(BuildContext context) {
       return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: context.themeRed,
            unselectedItemColor: Colors.grey,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.movie), label: 'Filmes'),
              BottomNavigationBarItem(icon: Icon(FilmesAppIcons.heart_empty), label: 'Favoritos'),
              BottomNavigationBarItem(icon: Icon(Icons.legend_toggle_outlined), label: 'Sair'),
            ],
          ),
          body: Navigator(
            initialRoute: '/movies',
            key: Get.nestedKey(1),
            onGenerateRoute: (settings) {
              if(settings.name == '/movies') {
                GetPageRoute(
                  settings: settings,
                  page: () => const MoviesPage(),
                );
              }

              if(settings.name == '/favorites') {
                GetPageRoute(
                  settings: settings,
                  page: () => const FavoritesPage(),
                );
              }
            },
          ),
       );
  }
}