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
  var messages = <MessageModel>[].obs; // RxList for reactive updates

  final ChatBotApiManager chatBotApiManager = Get.find<ChatBotApiManager>();

  @override
  Future<void> onInit() async {
    super.onInit();
    messageController = TextEditingController();

    // Fetch cached messages and ensure proper update synchronization
    final cachedMessages = await ChatCashedDataSource.getMessagesList();
    if (cachedMessages.isNotEmpty) {
      // Use RxList's `addAll` to trigger observable update safely
      messages.clear();
      messages.addAll(cachedMessages);
    }
  }

  @override
  void onClose() {
    messageController.dispose();

    // Save current state to cache upon closing
    ChatCashedDataSource.saveMessagesList(messages.toList());
    super.onClose();
  }

  @override
  Future<void> receiveMessage() async {
    final messageResponse =
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
  void sendMessage() {
    if (messageController.text.isNotEmpty) {
      // Add user's message to the list
      messages.add(
        MessageModel(
          message: messageController.text,
          messageType: MessageType.user,
          dateTime: DateTime.now(),
        ),
      );
      receiveMessage();

      // Clear input field and dismiss the keyboard focus
      messageController.clear();
      FocusScope.of(Get.context!).unfocus();
      // Process bot response asynchronously
    }
  }

  @override
  void attachFile() {
    throw UnimplementedError();
  }

  @override
  void openEmojiPicker() {
    throw UnimplementedError();
  }
}
