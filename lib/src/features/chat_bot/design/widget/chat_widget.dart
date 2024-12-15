import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../data/models/message.dart';
import '../controller/chat_controller.dart';
import 'message_widget.dart';

class ChatBuilder extends StatelessWidget {
  final ChatControllerImp controller;

  ChatBuilder({super.key, required this.controller});

  final ScrollController _scrollController = ScrollController();

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(() {
        // Ensure scrolling happens after updates
        if (controller.messages.isNotEmpty) {
          _scrollToBottom();
        }

        return ListView.separated(
          controller: _scrollController,
          cacheExtent: 1000,
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
                child:
                    controller.messages[index].messageType == MessageType.user
                        ? FadeInRight(
                            duration: const Duration(milliseconds: 400),
                            delay: const Duration(milliseconds: 400),
                            child: MessageWidget(
                              message: controller.messages[index],
                            ),
                          )
                        : FadeInLeft(
                            duration: const Duration(milliseconds: 400),
                            delay: const Duration(milliseconds: 400),
                            child: MessageWidget(
                              message: controller.messages[index],
                            ),
                          ));
          },
        );
      }),
    );
  }
}
