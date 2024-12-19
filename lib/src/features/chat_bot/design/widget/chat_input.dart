import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_gate_way/src/core/widgets/components/surface_container.dart';
import 'package:graduation_gate_way/src/core/widgets/components/text_input_field.dart';

import '../../../../core/theme/app_color.dart';
import '../controller/chat_controller.dart';

class ChatInput extends StatelessWidget {
  final ChatControllerImp controller;

  const ChatInput({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SurfaceContainer(
      borderRadius: 0,
      child: Row(
        children: [
          // Text input field
          Expanded(
            child: TextInputField(
              prefixIcon: IconButton(
                onPressed: () {
                  controller.openEmojiPicker();
                },
                icon: Icon(
                  Icons.emoji_emotions_outlined,
                  color: AppColors.grey,
                  size: 24.sp,
                ),
              ),
              hintText: 'Type your message...',
              controller: controller.messageController,
            ),
          ),
          SizedBox(width: 8.w),
          // Attachment button
          IconButton(
            onPressed: () {
              controller.attachFile();
            },
            icon: Icon(
              Icons.attach_file,
              color: AppColors.grey,
              size: 24.sp,
            ),
          ),
          // Send button
          IconButton(
            onPressed: () {
              controller.sendMessage();
            },
            icon: Icon(
              Icons.send,
              color: Theme.of(context).primaryColor,
              size: 24.sp,
            ),
          ),
        ],
      ),
    );
  }
}
