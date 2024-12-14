import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../data/data_source/api/chat_bot_api_manger.dart';
import '../../data/data_source/cashed/chat_cashed_data_source.dart';
import '../../data/models/message.dart';

abstract class ChatController extends GetxController {
  sendMessage();

  attachFile();

  openEmojiPicker();

  receiveMessage();
}

class ChatControllerImp extends ChatController {
  late final TextEditingController messageController;
  var messages = <MessageModel>[].obs; // RxList

  ChatBotApiManager chatBotApiManager = Get.find<ChatBotApiManager>();

  @override
  void onInit() async {
    messageController = TextEditingController();
    List<MessageModel> cashedMessages =
        await ChatCashedDataSource.getMessagesList();
    messages.assignAll(cashedMessages);
    super.onInit();
  }

  @override
  void onClose() {
    messageController.dispose();
    ChatCashedDataSource.saveMessagesList(messages);
    super.onClose();
  }

  @override
  receiveMessage() async {
    MessageModel messageResponse =
        await chatBotApiManager.sendMessage(messageController.text);
    messages.add(
      MessageModel(
        message: messageResponse.message,
        messageType: MessageType.bot,
        dateTime: DateTime.now(),
      ),
    );
  }

  @override
  sendMessage() {
    if (messageController.text.isNotEmpty) {
      messages.add(
        MessageModel(
          message: messageController.text,
          messageType: MessageType.user,
          dateTime: DateTime.now(),
        ),
      );
      receiveMessage();
      messageController.clear();
      FocusScope.of(Get.context!).requestFocus(FocusNode());
    }
  }

  @override
  attachFile() {
    throw UnimplementedError();
  }

  @override
  openEmojiPicker() {
    throw UnimplementedError();
  }
}
