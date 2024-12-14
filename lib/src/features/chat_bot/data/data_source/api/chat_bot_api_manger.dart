import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import '../../models/message.dart';

class ChatBotApiManager {
  static const url = 'https://fadyyosrey.pythonanywhere.com/chat';
  final http.Client client;
  static const Map<String, String> baseHeaders = {
    'Content-Type': 'application/json',
  };

  ChatBotApiManager({required this.client});

  Future<MessageModel> sendMessage(String message) async {
    final body = jsonEncode({'user_input': message});

    log('Sending message: $body'); // More descriptive log for the sent message
    try {
      final response = await client.post(
        Uri.parse(url),
        body: body,
        headers: baseHeaders,
      );
      if (response.statusCode == 200) {
        log('Response: ${response.body}');
        return MessageModel.fromJsonApi(jsonDecode(response.body));
      } else {
        log('Error: ${response.statusCode} - ${response.body}');
        throw Exception('Failed to send message: ${response.statusCode}');
      }
    } catch (e) {
      log('Error sending message: ${e.toString()}');
      rethrow; // You can also throw a more specific exception here
    }
  }
}
