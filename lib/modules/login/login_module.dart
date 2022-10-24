import 'package:appfilmesgetx/application/modules/module.dart';
import 'package:appfilmesgetx/modules/login/login_bindings.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import 'login_page.dart';

class LoginModule implements Module {
  @override
  List<GetPage> routers = [
    GetPage(
      name: '/login',
      page: () => const LoginPage(),
      binding: LoginBindings(),
    )
  ];
}
