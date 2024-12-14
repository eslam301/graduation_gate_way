class MessageModel {
  final String message;
  final MessageType messageType;
  final DateTime dateTime;

  MessageModel({
    required this.message,
    required this.messageType,
    required this.dateTime,
  });

  // Converts a MessageModel to a Map<String, dynamic> for JSON encoding
  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'messageType': messageType
          .toString()
          .split('.')
          .last, // Save enum as string (e.g., "user")
      'dateTime': dateTime.toIso8601String(), // Convert DateTime to string
    };
  }

  // Creates a MessageModel from a Map<String, dynamic> (used for decoding)
  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      message: json['message'],
      messageType: MessageType.values.firstWhere((e) =>
          e.toString().split('.').last ==
          json['messageType']), // Convert string back to enum
      dateTime: DateTime.parse(json['dateTime']),
    );
  }

  factory MessageModel.fromJsonApi(Map<String, dynamic> json) {
    return MessageModel(
      message: json['AI_response'],
      messageType: MessageType.bot, // Convert string back to enum
      dateTime: DateTime.now(),
    );
  }
}

enum MessageType {
  user,
  bot,
}
