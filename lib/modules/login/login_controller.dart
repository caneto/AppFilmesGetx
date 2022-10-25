import 'dart:developer';

import 'package:appfilmesgetx/application/ui/loader/loader_mixin.dart';
import 'package:appfilmesgetx/application/ui/messages/messages_maxin.dart';
import 'package:appfilmesgetx/services/login/login_service.dart';
import 'package:get/get.dart';

class LoginController extends GetxController with LoaderMixin, MessagesMaxin {
  final LoginService _loginService;
  final loading = false.obs;
  final message = Rxn<MessagesModel>();

  LoginController({required LoginService loginService})
      : _loginService = loginService;

  @override
  void onInit() {
    super.onInit();
    LoaderListener(loading);
    messagesListener(message);
  }

  Future<void> login() async {
    try {
      loading(true);
      await _loginService.login();
      loading(false);
      message(MessagesModel.info(title: 'Sucesso!', message: 'Login Relalizado com sucesso'));
    } catch (e, s) {
      loading(false);
      log('Erro ao realizar o Login', error: e, stackTrace: s);
      message(MessagesModel.error(title: 'Erro Login', message: 'Erro ao realizar o Login'));
    }
  }
}
