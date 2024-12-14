import 'dart:developer';

import 'package:get/get.dart';

import '../../../../../core/utils/shared_pref.dart';
import '../../models/message.dart';

class ChatCashedDataSource {
  static final List<MessageModel> messages = [];
  static const String messagesKey = 'messages';

  // Saves a list of MessageModel to SharedPreferences
  static Future<void> saveMessagesList(List<MessageModel> message) async {
    log('messages saved shared in pref successfully {${message.length}}');
    await SharedPref.saveList(
      messagesKey,
      message, // Convert objects to JSON
    );
    log('messages saved successfully {${message.length}}');
  }

  // Retrieves a list of MessageModel from SharedPreferences
  static Future<List<MessageModel>> getMessagesList() async {
    // Retrieve the list of JSON maps and decode it to MessageModel
    log('Messages retrieving, current length: ${messages.length}');

    // Retrieve the list from SharedPreferences
    List<dynamic> jsonList = await SharedPref.getList(messagesKey);

    // Clear any existing messages and assign the decoded ones
    messages.assignAll(
      jsonList
          .map((e) => MessageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

    log('Messages retrieved successfully, new length: ${messages.length}');

    // Returning the list of messages
    return messages;
  }
}
