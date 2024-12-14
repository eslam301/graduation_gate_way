import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../data/models/message.dart';
import '../controller/chat_controller.dart';
import 'message_widget.dart';

class ChatBuilder extends StatelessWidget {
  final ChatControllerImp controller;

  ChatBuilder({super.key, required this.controller});

  final ScrollController _scrollController = ScrollController();

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    }
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());

    return Expanded(
      child: SizedBox(
        width: 1.sw,
        child: Obx(() {
          WidgetsBinding.instance
              .addPostFrameCallback((_) => _scrollToBottom());
          return ListView.separated(
            controller: _scrollController,
            padding: const EdgeInsets.all(20),
            itemCount: controller.messages.length,
            separatorBuilder: (context, index) => const SizedBox(
              height: 10,
              width: 10,
            ),
            itemBuilder: (context, index) {
              return Align(
                alignment:
                    controller.messages[index].messageType == MessageType.bot
                        ? Alignment.centerLeft
                        : Alignment.centerRight,
                child: MessageWidget(
                  message: controller.messages[index],
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
