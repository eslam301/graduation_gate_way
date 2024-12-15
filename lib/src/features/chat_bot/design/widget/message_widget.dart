import 'package:flutter/material.dart';

import '../../../../core/theme/app_color.dart';
import '../../data/models/message.dart';
import 'auto_style_text.dart';

class MessageWidget extends StatelessWidget {
  final MessageModel message;

  const MessageWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          padding: const EdgeInsets.all(8),
          constraints: BoxConstraints(
            maxWidth: constraints.maxWidth * 0.9,
          ),
          decoration: BoxDecoration(
            color: message.messageType == MessageType.user
                ? AppColors.mainColor
                : AppColors.white,
            border: Border.all(color: AppColors.textColor),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: message.messageType == MessageType.user
                ? CrossAxisAlignment.end
                : CrossAxisAlignment.start,
            children: [
              AutoStyleText(
                message.message,
                textAlign: message.messageType == MessageType.user
                    ? TextAlign.end
                    : TextAlign.start,
                style: TextStyle(
                  color: message.messageType == MessageType.user
                      ? Colors.white
                      : Colors.black,
                ),
              ),
              Text(
                textAlign: TextAlign.end,
                '${message.dateTime.hour}:${message.dateTime.minute} ${message.dateTime.hour > 12 ? 'PM' : 'AM'}',
                style: const TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
        );
      },
    );
  }
}
