// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get/get.dart';

mixin MessagesMaxin on GetxController {
  void messagesListener(Rxn<MessagesModel> message) {
    ever<MessagesModel?>(message, (model) {
      if (model != null) {
        Get.snackbar(
          model.title,
          model.message,
          backgroundColor: 
        );
      }
    });
  }
}

class MessagesModel {
  final String title;
  final String message;
  final MessageType type;

  MessagesModel({
    required this.title,
    required this.message,
    required this.type,
  });

  MessagesModel.error({
    required this.title,
    required this.message,
  }) : type = MessageType.error;

  MessagesModel.info({
    required this.title,
    required this.message,
  }) : type = MessageType.info;
}

enum MessageType { error, info }
