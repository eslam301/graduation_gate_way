import 'package:flutter/material.dart';
import 'package:graduation_gate_way/src/core/widgets/components/surface_container.dart';

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
        return SurfaceContainer(
          color: message.messageType == MessageType.user
              ? AppColors.mainColor
              : Theme.of(context).colorScheme.surfaceTint,
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
                      : Theme.of(context).colorScheme.onSurface,
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
