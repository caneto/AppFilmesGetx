import 'package:appfilmesgetx/application/modules/module.dart';
import 'package:appfilmesgetx/modules/home/home_binding.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import 'home_page.dart';

class HomeModule extends Module {
  @override
  List<GetPage> routers = [
    GetPage(
      name: '/home',
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
  ];
}
