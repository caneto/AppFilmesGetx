import 'package:appfilmesgetx/application/auth/auth_service.dart';
import 'package:appfilmesgetx/application/rest_client/rest_client.dart';
import 'package:appfilmesgetx/repositories/login/login_repository.dart';
import 'package:appfilmesgetx/repositories/login/login_repository_impl.dart';
import 'package:appfilmesgetx/repositories/movies/movies_repository.dart';
import 'package:appfilmesgetx/repositories/movies/movies_repository_impl.dart';
import 'package:appfilmesgetx/services/login/login_service.dart';
import 'package:appfilmesgetx/services/login/login_service_impl.dart';
import 'package:appfilmesgetx/services/movies/movies_service.dart';
import 'package:appfilmesgetx/services/movies/movies_service_impl.dart';
import 'package:get/get.dart';

class ApplicationBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RestClient(), fenix: true);
    Get.lazyPut<LoginRepository>(
      () => LoginRepositoryImpl(),
      fenix: true,
    );
    Get.lazyPut<LoginService>(
      () => LoginServiceImpl(
        loginRepository: Get.find(),
      ),
      fenix: true,
    );
    Get.put(
      AuthService(),
    ).init();
    Get.lazyPut<MoviesRepository>(
      () => MoviesRepositoryImpl(
        restClient: Get.find(),
      ),
      fenix: true,
    );
    Get.lazyPut<MoviesService>(
      () => MoviesServiceImpl(
        moviesRespository: Get.find(),
      ),
      fenix: true,
    );
  }
}
