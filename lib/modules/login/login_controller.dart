
import 'package:appfilmesgetx/application/ui/loader/loader_mixin.dart';
import 'package:get/get.dart';

class LoginController extends GetxController with LoaderMixin {

  final loading = false.obs;

  @override
  void onInit() {
    super.onInit();
    LoaderListener(loading);
  }
  
  Future<void> login() async {
    loading(true);
    await 2.seconds.delay();
    loading(false);
  }
  
}